# Generated by Django 4.2 on 2024-08-17 11:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0010_alter_banner_ratation'),
    ]

    operations = [
        migrations.AddField(
            model_name='banner',
            name='url',
            field=models.URLField(default=1, verbose_name='Укажите ссылку'),
            preserve_default=False,
        ),
    ]
