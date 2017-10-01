from django.shortcuts import render,get_object_or_404,get_list_or_404
from django.template import loader
from django.views import generic

# Create your views here.

from django.http import HttpResponse
from django.http import Http404
from .models import Order
from django.utils import timezone

class DetailView(generic.DetailView):
    model = Order
    template_name = "book/detail.html"

def index(request):
    orders = Order.objects.filter(create_date__lte=timezone.now()).order_by("id")
    output = "|".join([ str(eo.id)+eo.color for eo in orders])
    template = loader.get_template("book/index.html")
    context = {"order_list":orders}
    return HttpResponse(template.render(context,request))


# def detail(request, id):
#     try:
#         order = Order.objects.get(pk=id)
#     except  Order.DoesNotExist:
#         raise Http404("没有找到Order")
#     context = {"detail":order}
#     return render(request,"book/detail.html",context)

def search(request, search):
    orders = get_list_or_404(Order,hair_type = search)
    return render(request,"book/index.html",{"order_list":orders})

