# Generated by Django 4.2 on 2024-03-06 07:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0005_slider_text'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='slider',
            name='text',
        ),
    ]
