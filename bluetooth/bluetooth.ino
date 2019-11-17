#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>

BLECharacteristic *characteristicTX; //através desse objeto iremos enviar dados para o client

bool deviceConnected = false; //controle de dispositivo conectado

#define SERVICE_UUID "ab0828b1-198e-4351-b779-901fa0e0371e"
#define CHARACTERISTIC_UUID_RX "4ac8a682-9736-4e5d-932b-e9b31405049c"
#define CHARACTERISTIC_UUID_TX "0972EF8C-7613-4075-AD52-756F33D4DA91"

//callback para eventos das características
class CharacteristicCallbacks : public BLECharacteristicCallbacks
{
    void onWrite(BLECharacteristic *pCharacteristic)
    {
        std::string rxValue = pCharacteristic->getValue();
        char cmd = rxValue[0];

        Serial.println("**************");
        Serial.print("Novo valor: ");
        Serial.println(cmd);
        Serial.println("**************");
    }
};

//callback para receber os eventos de conexão de dispositivos
class ServerCallbacks : public BLEServerCallbacks
{
    void onConnect(BLEServer *pServer)
    {
        deviceConnected = true;
    };

    void onDisconnect(BLEServer *pServer)
    {
        deviceConnected = false;
    }
};

void setup()
{
    Serial.begin(115200);

    // Create the BLE Device
    BLEDevice::init("R9 - Robô Gol"); // nome do dispositivo bluetooth

    // Create the BLE Server
    BLEServer *server = BLEDevice::createServer(); //cria um BLE server

    server->setCallbacks(new ServerCallbacks()); //seta o callback do server

    // Create the BLE Service
    BLEService *service = server->createService(SERVICE_UUID);

    // Create a BLE Characteristic para envio de dados
    characteristicTX = service->createCharacteristic(
        CHARACTERISTIC_UUID_TX,
        BLECharacteristic::PROPERTY_NOTIFY);

    characteristicTX->addDescriptor(new BLE2902());

    // Create a BLE Characteristic para recebimento de dados
    BLECharacteristic *characteristic = service->createCharacteristic(
        CHARACTERISTIC_UUID_RX,
        BLECharacteristic::PROPERTY_WRITE);

    characteristic->setCallbacks(new CharacteristicCallbacks());

    // Start the service
    service->start();

    // Start advertising (descoberta do ESP32)
    server->getAdvertising()->start();

    Serial.println("Aguardando algum dispositivo conectar...");

} //fim setup

void loop()
{
    //se existe algum dispositivo conectado
    if (deviceConnected)
    {
        Serial.println("Conectado");
    }
    delay(1000);
}
