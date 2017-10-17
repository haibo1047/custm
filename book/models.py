from django.db import models
import datetime
from django.utils import timezone

# Create your models here.

class Order(models.Model):
    class Meta:
        db_table = "Orders"

    HAIR_TYPE_SETS = (
        (1, "straight"),
        (2, "wavy"),
        (3, "curly"),
        (4, "coily")
    )

    HAIR_STRUCTURE_SETS = (
        (1, "fine"),
        (2, "medium"),
        (3, "coarse")
    )
    SCALP_MOISTURE_SETS = (
        (1, "dry"),
        (2, "normal"),
        (3, "oily")
    )
    create_date = models.DateTimeField("create_date")
    create_user = models.CharField("create_user",max_length=100,default="anoymous")
    hair_type = models.IntegerField("hair_type", choices= HAIR_TYPE_SETS )
    hair_structure = models.IntegerField("hair_structure", choices= HAIR_STRUCTURE_SETS)
    scalp_moisture = models.IntegerField("scale_moisture", choices= SCALP_MOISTURE_SETS)
    goals = models.CharField("goals", max_length=200, null= True)

    # def save(self, *args, **kwargs):
    #     if self.id is None:
    #         self.create_date = timezone.now()
    #     print(kwargs)
    #     super(Order,self).save(*args, **kwargs)

    def was_published_recently(self):
        return timezone.now() >= self.create_date >= (timezone.now() - datetime.timedelta(days=1))

    def __str__(self):
        return str(self.id) + "--" + self.create_user