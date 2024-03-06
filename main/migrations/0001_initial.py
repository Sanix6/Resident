# Generated by Django 4.2 on 2024-03-05 09:56

import ckeditor.fields
from django.db import migrations, models
import django.db.models.deletion
import smart_selects.db_fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(blank=True, null=True, verbose_name='Слаг')),
                ('name', models.CharField(blank=True, max_length=255, null=True, verbose_name='Название')),
                ('language', models.CharField(blank=True, choices=[('kg', 'Кыргыз тили'), ('ru', 'Русский язык')], default='ru', max_length=255, null=True, verbose_name='Язык')),
                ('is_active', models.BooleanField(verbose_name='Активно')),
            ],
            options={
                'verbose_name': '',
                'verbose_name_plural': 'Категория',
            },
        ),
        migrations.CreateModel(
            name='Resident',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(blank=True, max_length=1000, null=True, unique=True, verbose_name='Слаг')),
                ('image', models.ImageField(upload_to='', verbose_name='Изображение')),
                ('title', models.CharField(blank=True, max_length=255, null=True, verbose_name='Название')),
                ('views', models.PositiveIntegerField(default=0, verbose_name='Просмотры')),
                ('data', models.DateField(blank=True, null=True, verbose_name='Дата добавление')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Дата обновление')),
                ('last_mod', models.DateTimeField(auto_now=True, verbose_name='Последняя модификация')),
                ('save_state', models.BooleanField(default=False, verbose_name='Опубликовано')),
                ('header', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='state', to='main.category', verbose_name='категория')),
            ],
            options={
                'verbose_name': '',
                'verbose_name_plural': 'Журнал',
            },
        ),
        migrations.CreateModel(
            name='Slider',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='', verbose_name='Изображение')),
                ('title', models.CharField(blank=True, max_length=255, null=True, verbose_name='Название')),
                ('description', models.CharField(blank=True, max_length=255, null=True, verbose_name='Текст')),
            ],
            options={
                'verbose_name': '',
                'verbose_name_plural': 'Слайдеры',
            },
        ),
        migrations.CreateModel(
            name='SubHeader',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(blank=True, null=True, verbose_name='Слаг')),
                ('title', models.CharField(blank=True, max_length=255, null=True, verbose_name='Название')),
                ('header', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='header', to='main.category', verbose_name='Шапка')),
            ],
            options={
                'verbose_name': '',
                'verbose_name_plural': 'Подкатегория',
            },
        ),
        migrations.CreateModel(
            name='ResidentDetail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', ckeditor.fields.RichTextField(blank=True, null=True, verbose_name='Text')),
                ('key', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='resident', to='main.resident')),
            ],
            options={
                'verbose_name': 'Дополнительно',
                'verbose_name_plural': 'Дополнительно',
            },
        ),
        migrations.AddField(
            model_name='resident',
            name='name',
            field=smart_selects.db_fields.ChainedForeignKey(auto_choose=True, blank=True, chained_field='header', chained_model_field='header', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='resident', to='main.subheader', verbose_name='Подкатегория'),
        ),
    ]
