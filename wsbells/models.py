from django.template.loader import get_template
from django.db import models
from django.conf import settings
from wsbells import ws
import json

# Create your models here.

class QueueWS(models.Model):
    class Meta:
        abstract = True

    def qname(self):
        name = '%s%s' % (self.__class__.__name__, self.id)
        return name

    @classmethod
    def ws_queues(cls, queryset):
        """
        Return proper json for ws client subscription.
        """
        
        qnames = ['%s%s' % (ind.__class__.__name__, ind.id) 
        for ind in queryset.only('id')]

        return qnames

class UserWS(QueueWS):
    def ws_subscribe(self, queue, target=None):
        target = target if target else self
        self.ws_cmd(target, 'ws-subscribe', queue.qname())

    def ws_unsubscribe(self, queue, target=None):
        target = target if target else self
        self.ws_cmd(target, 'ws-unsubscribe', queue.qname())

    def ws_restart(self, target=None):
        """
        
        """
        target = target if target else self
        self.ws_cmd(target, 'ws-restart')

    def ws_cmd(self, target, cmd, *args, **kwargs):
        """
        """

        # Make the command in a way that the sender is the second
        # parameter. It should be ajson-like structure though.
        data = '%s %s %s' % (cmd, self.qname(), ' '.join(args))
        ws.publish(target.qname(), data, **kwargs)

    def connected_queues(self):
        """
        Should be overriden and return a list of all queues
        that the user should start subscribed to.

        This method should be used altogether with QueueWS.ws_queues.
        """
        pass

    def ws_connection(self):
        qnames = self.connected_queues()
        qnames.append(self.qname())

        context = {'WS_HOST': settings.WS_HOST, 'WS_PORT':settings.WS_PORT, 
        'client_id': self.id, 'WS_USE_SSL': settings.WS_USE_SSL, 'me': self,
         'qnames': json.dumps(qnames)}

        tmp  = get_template('wsbells/ws_connection.html')
        html = tmp.render(context)
        return html



