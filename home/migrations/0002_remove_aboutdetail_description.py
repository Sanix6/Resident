# Generated by Django 5.0.2 on 2024-02-17 17:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='aboutdetail',
            name='description',
        ),
    ]