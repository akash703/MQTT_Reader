import asyncio
from gmqtt import Client as MQTTClient

BROKER = 'localhost'
TOPIC = '/events'
PORT = 1884

async def on_message(client, topic, payload, qos, properties):
    print(f'Received message on topic {topic}: {payload.decode()}')

async def mqtt_client():
    client = MQTTClient('mqtt_client_id')

    # Assign the callback for messages
    client.on_message = on_message

    # Connect to the broker
    await client.connect(BROKER, PORT)

    # Subscribe to the topic /events
    client.subscribe(TOPIC, qos=1)

    # Keep the client connected indefinitely
    await asyncio.sleep(999999)
async def main():
    await mqtt_client()

if __name__ == "__main__":
    asyncio.run(main())