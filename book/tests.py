from django.test import TestCase,Client

from.models import Order
from django.urls import reverse
from django.utils import timezone
import datetime

# Create your tests here.

class OrderTest(TestCase):

    client = Client()
    def test_published_recently(self):
        order = Order(create_date=timezone.now()+datetime.timedelta(days=30), color="black", hair_type="x")
        self.assertIs(order.was_published_recently(),False)

    def create_order(days):
        create_date = timezone.now() + datetime.timedelta(days)
        return Order(create_date = create_date, color = "nothing")

    def test_no_order(self):
        response = self.client.get(reverse("index"))
        self.assertEqual(response.status_code,200)
        self.assertContains(response,"No orders are available.")
        self.assertQuerysetEqual(response.context["order_list"],[])



