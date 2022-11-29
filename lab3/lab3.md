University: [ITMO University](https://itmo.ru/ru/) <br/>
Faculty: [FICT](https://fict.itmo.ru) <br/>
Course: [Network programming](https://github.com/itmo-ict-faculty/network-programming) <br/>
Year: 2022/2023 <br/>
Group: K34202 <br/>
Author: Perov Ivan <br/>
Lab: Lab3 <br/>
Date of create: 29.11.2022 <br/>
Date of finished: xx.11.2022 <br/>

# Лабораторная работа №3 "Развертывание Netbox, сеть связи как источник правды в системе технического учета Netbox"

## Описание
   В данной лабораторной работе вы ознакомитесь с интеграцией Ansible и Netbox и изучите методы сбора информации с помощью данной интеграции.

## Цель работы:
   С помощью Ansible и Netbox собрать всю возможную информацию об устройствах и сохранить их в отдельном файле.

## Ход работы:
   В процессе выполнения лабораторной работы были выпонены следующие шаги:
   
   ### Развертывание Netbox на Ubuntu ###
   1. Изначально была предпринята попытка установить Netbox самостоятельно и настроить работу с ним вручную. Попытка не увенчалась успехом по причине того, что nginx и apache2 начали ругаться на якобы закрытый порт 80 (хотя он был свободен). По этой причине был выбран путь установки Netbox docker контейнера.

![image](https://user-images.githubusercontent.com/17079352/204521034-136b7a48-08ec-485c-8ee8-b426dba0cda2.png)

 
   2. В NetBox были созданы site, devices type, manufactures и добавлены CHR и CHR_2, и информация о них.

![image](https://user-images.githubusercontent.com/17079352/204521659-d3b7267d-a132-428f-91b0-f2d98831ac45.png)

   3. Из NetBox экспортирован файл netbox_devices.csv с данными о CHR1, CHR2. С помощью утилиты scp, которая работает через протокол ssh, файл netbox_devices передан на Yandex Server (Ubuntu 20). 

![image](https://user-images.githubusercontent.com/17079352/204522663-fe6224a1-6f07-46ba-a010-93202107ee66.png)

### Написание сценария для настройки CHR1, CHR2 ###

   5. Был написан сценарий для настройки сетевых устройств

[<img src="https://user-images.githubusercontent.com/58363643/201353339-d6f4bf3b-1201-46c9-94ce-04db7ea3d393.png" width="400"/>](https://user-images.githubusercontent.com/58363643/201353339-d6f4bf3b-1201-46c9-94ce-04db7ea3d393.png)

   6. Была выполнена проверка изменения настроек сетевого устройства
   
[<img src="https://user-images.githubusercontent.com/58363643/201350970-1d9b9fda-f21b-4029-a275-1e0f35d53c79.png" width="200"/>](https://user-images.githubusercontent.com/58363643/201350970-1d9b9fda-f21b-4029-a275-1e0f35d53c79.png)

### Написание сценария для создания устройтва в NetBox ###
   7. Был создан сценарий для получения серийного номера сетевого устройства и создания устройства в NetBox

[<img src="https://user-images.githubusercontent.com/58363643/201636103-ba637bf6-4a4c-4b4c-8fa6-d50a3099f356.png" width="400"/>](https://user-images.githubusercontent.com/58363643/201636103-ba637bf6-4a4c-4b4c-8fa6-d50a3099f356.png)

   8. Была выполнена проверка работы сценария
   
[<img src="https://user-images.githubusercontent.com/58363643/201635874-79a00d34-f62b-411b-979e-0979208d61b0.png" width="400"/>](https://user-images.githubusercontent.com/58363643/201635874-79a00d34-f62b-411b-979e-0979208d61b0.png)

[<img src="https://user-images.githubusercontent.com/58363643/201635820-ea4fc208-9ca6-4c1a-8d38-814b5bcd8cb7.png" width="800"/>](https://user-images.githubusercontent.com/58363643/201635820-ea4fc208-9ca6-4c1a-8d38-814b5bcd8cb7.png)

## Выводы:
   Таким образом, в процессе выполнения лабораторной работы ознакомились с инструментом NetBox, были созданы сценарии Ansible для работы с NetBox. Также была выполнена проверка локальной связности между роутерами и NetBox.
   
[<img src="https://user-images.githubusercontent.com/58363643/201637927-5f979abc-82b9-4670-9bb7-f2811174bf9a.png" width="400"/>](https://user-images.githubusercontent.com/58363643/201637927-5f979abc-82b9-4670-9bb7-f2811174bf9a.png)

[<img src="https://user-images.githubusercontent.com/58363643/201636964-661a106e-6b31-4ceb-b67f-8cd60fe4f803.png" width="200"/>](https://user-images.githubusercontent.com/58363643/201636964-661a106e-6b31-4ceb-b67f-8cd60fe4f803.png)

![image](https://user-images.githubusercontent.com/58363643/201857358-49a28fbe-1516-47f5-949d-ea736c716819.png)
![image](https://user-images.githubusercontent.com/58363643/201857815-b05b40db-55ef-48c3-9d37-754fcee9d765.png)
