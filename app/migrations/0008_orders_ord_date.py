# Generated by Django 3.0.6 on 2021-06-18 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_auto_20210618_1458'),
    ]

    operations = [
        migrations.AddField(
            model_name='orders',
            name='ord_date',
            field=models.CharField(default=1, max_length=10),
            preserve_default=False,
        ),
    ]
