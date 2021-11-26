import os
import glob
import sys
import asyncio
from pyrogram import Client


bot_token = os.environ.get('BOT_TOKEN') or sys.exit('BOT_TOKEN environment variable is empty!')
chat_id = int(os.environ.get('CHAT_ID') or sys.exit('CHAT_ID environment variable is empty!'))


app = Client(
    session_name='py2tg',
    api_id='469872',
    api_hash='ae5460690d1509ecd1b8c3382f1e5c71',
    bot_token=bot_token,
    no_updates=True,
)

async def main():
    files = glob.glob(f'/backups/daily/*.sql.gz')
    if not files:
        return

    async with app:
        try:
            file = max(files, key=os.path.getctime)
            await app.send_document(chat_id=chat_id, document=file)
            print('Uploaded to Telegram.')
        except Exception as e:
            print(e)


asyncio.get_event_loop().run_until_complete(main())
