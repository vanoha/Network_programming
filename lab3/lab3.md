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

   4. Следующее задание разделено на 2 части: получить имена роутеров из файла netbox_devices.csv и изменить имена роутеров. Потом всё это соединено в один playbook. Имена роутеров действительно изменились.

![image](https://user-images.githubusercontent.com/17079352/204849795-c4862b2c-9768-4c58-8c9f-908c4694a957.png)
![image](https://user-images.githubusercontent.com/17079352/204849998-ca6c28ac-4976-4c35-b86b-10a9083779c0.png)

   5. Теперь задача обратная предыдущей - с помощью ansible playbook нужно передать информацию о роутере в NetBox.

![image](https://user-images.githubusercontent.com/17079352/204851258-d1d10cd7-10c5-41c1-b5db-a7850f8ca5cd.png)

   6. В NetBox действительно был создан новый роутер
   
![image](https://user-images.githubusercontent.com/17079352/204851472-02ad256b-0888-472f-a858-9fc3d5f797ac.png)

   7. Был создан playbook, цель которого - достать информацию о серийном номере из микротика и отправить эту информацию в NetBox

![image](https://user-images.githubusercontent.com/17079352/204865956-866d2cd4-4e10-45d4-8cfa-fb2a23c0957c.png)

   8. Playbook отработал без ошибок и создал новый device в NetBox с серийным номером
   
![image](https://user-images.githubusercontent.com/17079352/204866374-9a5df20e-085e-420b-bc13-e162ddf6e138.png)
![image](https://user-images.githubusercontent.com/17079352/204866265-d36ffe84-66f4-4112-81c4-ae66b1d2f550.png)


## Выводы:
   Таким образом, в процессе выполнения лабораторной работы ознакомился с инструментом NetBox, были созданы сценарии Ansible для работы с NetBox. Также была выполнена проверка локальной связности между роутерами и NetBox.
   
![image](https://user-images.githubusercontent.com/17079352/204866927-086decc5-5cfa-4b67-b050-a1b5a7349779.png)

![image](https://user-images.githubusercontent.com/17079352/204867581-1db69d98-8c65-4bec-82fd-f3bf636c03b0.png)
![image](https://user-images.githubusercontent.com/17079352/204867926-4a071d78-0ce0-4d8a-88a1-51c186ea0984.png)
