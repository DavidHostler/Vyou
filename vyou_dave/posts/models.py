from django.db import models
import random


class Post(models.Model):

    owner = models.ForeignKey('auth.User', related_name='posts', on_delete=models.CASCADE, default=1)
    post_id = models.CharField(max_length=15, default="N/A")
    description = models.CharField(max_length = 301)
    timestamp = models.DateTimeField(auto_now = True)
    longitude = models.FloatField(default = 0.00)
    latitude = models.FloatField(default = 0.00)
    image = models.ImageField(upload_to = "images", default = "Empty")

    def __str__(self):
        return self.post_id


