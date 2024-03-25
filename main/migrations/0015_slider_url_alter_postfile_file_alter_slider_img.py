# Generated by Django 4.2 on 2024-03-19 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0014_rename_user_comment_comments_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='slider',
            name='url',
            field=models.URLField(blank=True, null=True, verbose_name='Укажите ссылку'),
        ),
        migrations.AlterField(
            model_name='postfile',
            name='file',
            field=models.FileField(blank=True, null=True, upload_to='uploads/', verbose_name='Прикрепить файл'),
        ),
        migrations.AlterField(
            model_name='slider',
            name='img',
            field=models.ImageField(blank=True, null=True, upload_to='slider/', verbose_name='Изображение'),
        ),
    ]