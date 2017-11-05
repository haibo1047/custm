from django.db import models
import datetime
from django.utils import timezone
from django.utils.translation import pgettext_lazy
from django.utils.text import format_lazy

from .utils import convertTupleToDict

# Create your models here.

class Order(models.Model):
    class Meta:
        db_table = "Orders"

    HAIR_TYPE_SETS = (
        (1, pgettext_lazy("hair type","straight")),
        (2, pgettext_lazy("hair type","wavy")),
        (3, pgettext_lazy("hair type","curly")),
        (4, pgettext_lazy("hair type","coily")),
    )
    HAIR_STRUCTURE_SETS = (
        (1, pgettext_lazy("hair structure","fine")),
        (2, pgettext_lazy("hair structure","medium")),
        (3, pgettext_lazy("hair structure","coarse")),
    )
    SCALP_MOISTURE_SETS = (
        (1, pgettext_lazy("scalp moisture","dry")),
        (2, pgettext_lazy("scalp moisture","normal")),
        (3, pgettext_lazy("scalp moisture","oily")),
    )
    COLOR_SETS = (
        (1, pgettext_lazy("color","blue")),
        (2, pgettext_lazy("color","pink")),
        (3, pgettext_lazy("color","purple")),
    )
    FRAGRANCE_SETS = (
        (1, pgettext_lazy("fragrance","all(you)")),
        (2, pgettext_lazy("fragrance","calyptus")),
        (3, pgettext_lazy("fragrance","hibis(kiss)")),
        (4, pgettext_lazy("fragrance","musk - have")),
        (5, pgettext_lazy("fragrance","peony")),
        (6, pgettext_lazy("fragrance","tail")),
        (7, pgettext_lazy("fragrance","feeling(f)")),
        (8, pgettext_lazy("fragrance","ineapple")),
    )
    FRAGRANCE_STRENGTH_SETS = (
        (1, pgettext_lazy("fragrance strength","Light")),
        (2, pgettext_lazy("fragrance strength","Medium")),
        (3, pgettext_lazy("fragrance strength","Strong")),
    )
    SIZE_SETS = (
        (0, ""),
        (1, "500ml"),
        (7, "1000ml"),
    )

    create_date = models.DateTimeField("create_date")
    create_user = models.CharField("create_user",max_length=100,default="anoymous")

    hair_type = models.IntegerField("hair_type", choices= HAIR_TYPE_SETS)
    def getHairType(self):
        return convertTupleToDict(self.HAIR_TYPE_SETS).get(self.hair_type)

    hair_structure = models.IntegerField("hair_structure", choices= HAIR_STRUCTURE_SETS)
    def getHairStructure(self):
        return convertTupleToDict(self.HAIR_STRUCTURE_SETS).get(self.hair_structure)

    scalp_moisture = models.IntegerField("scale_moisture", choices= SCALP_MOISTURE_SETS)
    def getScalpMoisture(self):
        return convertTupleToDict(self.SCALP_MOISTURE_SETS).get(self.scalp_moisture)

    goals = models.CharField("goals", max_length=200, null= True)
    def getGoals(self):
        thegoals = ""
        for g in self.goals.split("|"):
            if len(thegoals) > 0:
                thegoals += "/"
            thegoals += pgettext_lazy("goals", g.replace("_"," "))+""
        return thegoals

    shampoo_color = models.IntegerField("shampoo_color",choices=COLOR_SETS)
    def getShampooColor(self):
        return convertTupleToDict(self.COLOR_SETS).get(self.shampoo_color)

    conditioner_color = models.IntegerField("conditioner_color",choices=COLOR_SETS)
    def getConditionerColor(self):
        return convertTupleToDict(self.COLOR_SETS).get(self.conditioner_size)

    fragrance = models.IntegerField("fragrance",choices=FRAGRANCE_SETS)
    def getFragrance(self):
        return convertTupleToDict(self.FRAGRANCE_SETS).get(self.fragrance)

    fragrance_strength = models.IntegerField("frangrance_strength",choices=FRAGRANCE_STRENGTH_SETS)
    def getFragranceStrength(self):
        return convertTupleToDict(self.FRAGRANCE_STRENGTH_SETS).get(self.fragrance_strength)

    shampoo_size = models.IntegerField("shampoo_size",choices=SIZE_SETS)
    def getSampooSize(self):
        return convertTupleToDict(self.SIZE_SETS).get(self.shampoo_size)

    conditioner_size = models.IntegerField("conditioner_size",choices=SIZE_SETS)
    def getConditionerSize(self):
        return convertTupleToDict(self.SIZE_SETS).get(self.conditioner_size)

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