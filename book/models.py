from django.db import models
import datetime
from django.utils import timezone

# Create your models here.

class Order(models.Model):
    create_date = models.DateTimeField("_hide_create_date")
    color = models.CharField("颜色",max_length = 20)
    hair_type = models.CharField("发质类型",max_length = 20, default = "1")
    hair_structure = models.CharField("发质结构",max_length = 20, default = "1")
    scalp_moisture = models.CharField("头皮油性",max_length = 20, default = "1")

    def was_published_recently(self):
        return timezone.now() >= self.create_date >= (timezone.now() - datetime.timedelta(days=1))

    def __str__(self):
        return "["+str(self.create_date)+"--颜色:"+self.color+";发质类型:"+self.hair_type+";发质结构:"+self.hair_structure+";头皮油性:"+self.scalp_moisture+"]"