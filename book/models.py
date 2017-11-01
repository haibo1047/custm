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
    COLOR_SETS = (
        (1, "blue"),
        (2, "pink"),
        (3, "purple")
    )
    FRANGRANCE_STRENGTH_SETS = (
        (1, "light"),
        (2, "medium"),
        (3, "strong")
    )
    SIZE_SETS = (
        (0, ""),
        (1, "80ml"),
        (7, "300ml")
    )
    create_date = models.DateTimeField("create_date")
    create_user = models.CharField("create_user",max_length=100,default="anoymous")
    hair_type = models.IntegerField("hair_type", choices= HAIR_TYPE_SETS)
    hair_structure = models.IntegerField("hair_structure", choices= HAIR_STRUCTURE_SETS)
    scalp_moisture = models.IntegerField("scale_moisture", choices= SCALP_MOISTURE_SETS)
    goals = models.CharField("goals", max_length=200, null= True)
    shampoo_color = models.IntegerField("shampoo_color",choices=COLOR_SETS)
    conditioner_color = models.IntegerField("conditioner_color",choices=COLOR_SETS)
    fragrance = models.IntegerField("fragrance",default=1)
    fragrance_strength = models.IntegerField("frangrance_strength",choices=FRANGRANCE_STRENGTH_SETS)
    shampoo_size = models.IntegerField("shampoo_size",choices=SIZE_SETS)
    conditioner_size = models.IntegerField("conditioner_size",choices=SIZE_SETS)

    formula_name = models.CharField("formula_name",max_length=200,null=True)


    # def save(self, *args, **kwargs):
    #     if self.id is None:
    #         self.create_date = timezone.now()
    #     print(kwargs)
    #     super(Order,self).save(*args, **kwargs)

    def was_published_recently(self):
        return timezone.now() >= self.create_date >= (timezone.now() - datetime.timedelta(days=1))

    def __str__(self):
        return str(self.id) + "--" + self.create_user