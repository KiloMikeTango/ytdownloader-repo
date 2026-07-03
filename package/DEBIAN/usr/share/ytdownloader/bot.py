import os
import telebot
import yt_dlp
import requests
from dotenv import load_dotenv

# Your Cloudflare Worker URL
WORKER_URL = "https://yt-auth.thuk6810.workers.dev/"

# Setup bot
load_dotenv()
BOT_TOKEN = os.getenv("BOT_TOKEN")
bot = telebot.TeleBot(BOT_TOKEN)

def is_authorized(user_id):
    """Check with your Central Cloudflare Database"""
    try:
        response = requests.get(f"{WORKER_URL}/check?id={user_id}")
        return response.text == "OK"
    except:
        return False

@bot.message_handler(commands=['start'])
def start(message):
    user_id = message.from_user.id
    if is_authorized(user_id):
        bot.reply_to(message, "Link ပို့ပြီး Video Download လုပ်လို့ရပါပြီနော်😊")
    else:
        bot.reply_to(message, f"❌ Video Downoad လုပ်လို့မရပါ၊ Request access from Admin.\nYour ID: {user_id}")

@bot.message_handler(func=lambda message: True)
def download_handler(message):
    user_id = message.from_user.id
    
    # Permission Check
    if not is_authorized(user_id):
        bot.reply_to(message, "🚫 You are not authorized to use this bot.")
        return

    url = message.text.strip()
    msg = bot.reply_to(message, "⬇️ ခဏစောင့်ပါ...")

    try:
        ydl_opts = {
            'format': 'best',
            'outtmpl': '%(title)s.%(ext)s',
            'quiet': True
        }
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info = ydl.extract_info(url, download=True)
            filename = ydl.prepare_filename(info)
            
        bot.edit_message_text(f"✅ Download လုပ်ပြီးပါပြီ: {info.get('title')}", message.chat.id, msg.message_id)
        
        # Optional: Send file back to user
        with open(filename, 'rb') as f:
            bot.send_video(message.chat.id, f)
        os.remove(filename) # Clean up after send
            
    except Exception as e:
        bot.edit_message_text(f"❌ Error: {str(e)}", message.chat.id, msg.message_id)

if __name__ == '__main__':
    bot.infinity_polling()
