
# MQTT Reader

## Overview
The MQTT Reader is a Python application that connects to a Mosquitto MQTT broker, listens for messages on a specified topic, and allows for message publishing. This project is designed to demonstrate the use of MQTT in a lightweight and efficient manner using asynchronous programming.

## Requirements
- Python 3.x
- Docker (for containerization)
- MQTT Broker (e.g., Mosquitto)

## Installation

### Using Docker
1. Clone this repository:
   ```bash
   git clone https://github.com/akash703/MQTT_Reader
   cd mqtt-reader
   ```

2. Build the Docker image:
   ```bash
   docker build -t mqtt-reader .
   ```

3. Run the Mosquitto broker in a Docker container:
   ```bash
   docker run -d --name mqtt-broker -p 1883:1883 eclipse-mosquitto
   ```

4. Run the MQTT Reader container:
   ```bash
   docker run --network host mqtt-reader
   ```

### Without Docker
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/mqtt-reader.git
   cd mqtt-reader
   ```

2. Create a virtual environment (optional but recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scriptsctivate`
   ```

3. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the MQTT Reader:
   ```bash
   python mqtt_reader.py
   ```

## Configuration
Update the following constants in `mqtt_reader.py` to connect to your MQTT broker:
```python
BROKER = 'mqtt-broker'  # Change to the broker address or IP if necessary
PORT = 1884  # Change if your broker uses a different port
```

## Usage
- The MQTT Reader will connect to the specified broker and listen for messages on the `/events` topic.
- You can manually publish messages to the topic using the following command:
   ```bash
   mosquitto_pub -h localhost -t '/events' -m '{"sensor_value":20.2}'
   ```

## Handling Connection Issues
If you encounter the "connection lost" error, consider the following:
- Ensure that the Mosquitto broker is running and accessible.
- Verify the broker address and port in your configuration.
- Check firewall settings if running on cloud services.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements
- [Mosquitto](https://mosquitto.org/) for the MQTT broker
- [gmqtt](https://pypi.org/project/gmqtt/) for the MQTT client library
