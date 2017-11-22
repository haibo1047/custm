from django.contrib import admin

# Register your models here.

from .models import Order

from django.utils import timezone

class OrderAdmin(admin.ModelAdmin):
    list_display = ("id","goals","was_published_recently","create_date","create_user")
    list_filter = ("create_date","goals")

    search_fields = ["hair_type"]
    fieldsets = [
        ("Hair profile", {"fields" :["hair_structure", "scalp_moisture", "hair_type"]}),
        ("Other info",{"fields" : ["goals"]})
    ]
    def save_model(self, request, obj, form, change):
        if obj.id is None:
            obj.create_date = timezone.now()
            obj.create_user = request.user
        super().save_model(request, obj, form, change)

# admin.site.register(Order,OrderAdmin)
