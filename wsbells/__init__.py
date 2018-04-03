import paho.mqtt.client as paho
from django.conf import settings

def on_connect(client, userdata, flags, rc):
    print("CONNACK received with code %d." % (rc))
    # client.subscribe('beta')
    client.publish('beta', 'Excellent!', 0, False)

def on_publish(client, userdata, mid):
    print("mid: "+str(mid))

def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))

ws = paho.Client()
ws.on_connect = on_connect
ws.on_publish = on_publish
ws.on_message = on_message

ws.username_pw_set(settings.MQTT_USER, settings.MQTT_PASS)
ws.connect(settings.MQTT_HOST, settings.MQTT_PORT, 60)

ws.loop_start()






