from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand
from main.models import Post
from PIL import Image
from io import BytesIO
import sys

class Command(BaseCommand):
    help = 'Compress existing images in the database to be no larger than 200KB.'

    def handle(self, *args, **kwargs):
        for obj in Post.objects.all():
            if obj.img:
                img = Image.open(obj.img)
                max_size = (850, 850)
                img.thumbnail(max_size)

                if img.mode == 'RGBA':
                    img = img.convert('RGB')

                thumb_io = BytesIO()
                quality = 85 

                while True:
                    thumb_io = BytesIO()
                    img.save(thumb_io, format='JPEG', quality=quality)
                    size = thumb_io.tell()

                    if size <= 200 * 1024: 
                        break
                    else:
                        quality -= 5  

                    if quality < 10: 
                        break

                obj.img.save(obj.img.name, ContentFile(thumb_io.getvalue()), save=False)
                obj.save()
                
                self.stdout.write(f'Successfully compressed {obj.img.name} to {size / 1024:.2f}KB')

        self.stdout.write('All images have been compressed to be under 200KB.')
