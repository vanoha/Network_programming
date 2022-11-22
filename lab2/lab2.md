University: [ITMO University](https://itmo.ru/ru/) <br/>
Faculty: [FICT](https://fict.itmo.ru) <br/>
Course: [Network programming](https://github.com/itmo-ict-faculty/network-programming) <br/>
Year: 2022/2023 <br/>
Group: K34202 <br/>
Author: Perov Ivan <br/>
Lab: Lab2 <br/>
Date of create: 22.11.2022 <br/>
Date of finished: x.11.2022 <br/>

# Лабораторная работа №2 "Развертывание дополнительного CHR, первый сценарий Ansible"

## Описание
   В данной лабораторной работе на практике изучается система управления конфигурацией Ansible, использующаяся для автоматизации настройки и развертывания программного обеспечения.

## Цель работы:
   С помощью Ansible настроить несколько сетевых устройств и собрать информацию о них. Правильно собрать файл Inventory.

## Ход работы:
   В процессе выполнения лабораторной работы были выпонены следующие шаги:
   
   ### Создание виртуальной машины на VirtualBox, установка CHR, организация OVPN-клиента ###
   
   1. Работа началась с того, что для дальнейшего процесса нужна была другая версия CHR (версия 7.6). Была переустановлена система.
   2. Создана вторая виртуальная машина CHR, путем клонирования первом ВМ.
   3. Для использования WinBox нужно было знать IP-адрес вновь созданной машины. Был получен IP-адрес второй ВМ.
   4. Получены сертификат и ключ для OVPN-клиента vanoha_2. В WInBox были имортированы сертификат и ключ, настроен OpenVPN-клиент.
   
      ![image](https://user-images.githubusercontent.com/17079352/203325904-2406de01-e166-47be-8d8f-39635df9a395.png)
      
   ### Настройка CHR-машин с помощью Ansible

   5. Сначала был настроен конфигурационный файл /etc/ansible/hosts, где были прописаны основные данные о RouterOS: IP-адрес, логин и пароль от учетной записи.

   6. Проверено возможность подключения удаленного сервера к роутерам.
   
      ```
      ansible all -m ping
      ```
      [<img src="https://user-images.githubusercontent.com/58363643/194758473-81a7018d-a803-4504-af01-267ff3425532.png" width="200"/>](https://user-images.githubusercontent.com/58363643/194758473-81a7018d-a803-4504-af01-267ff3425532.png)
    
   7. Следующие задания были сделаны сначала раздельно, потом соединены в один playbook. Создан playbook, которые создает пользователя user с паролем password на роутерах. 
      
      ![image](https://user-images.githubusercontent.com/17079352/203326931-737c488c-092d-49d3-bc97-17699e6bb0e9.png)
      
   8. Пользователь действительно был создан.
      
      ![image](https://user-images.githubusercontent.com/17079352/203327382-cce2dbcc-5977-4614-8bb9-3e86be83635e.png)
      
   9. Настроен NTP-клиент на обеих машинах.

   ![image](https://user-images.githubusercontent.com/17079352/203327522-d8fc4760-b2b7-46c5-81bb-08b7e93666a6.png)

   ![image](https://user-images.githubusercontent.com/17079352/203327642-76f7a53c-863f-4194-8162-4076f02c92fc.png)
   
   10. Был настроен OSPF с помощью Ansible (в соответствии со схемой, представленной снизу)
      
   ![image](https://user-images.githubusercontent.com/17079352/203333955-b8def1f0-0633-4c46-87ad-0b1c044f0c25.png)

   ![image](https://user-images.githubusercontent.com/17079352/203334420-39b93597-bf8f-4e46-9883-83031022bb2a.png)
   
   В разделе Neighbor в Winbox была выполнена проверка правильности настройки OSPF.
   
   ![image](https://user-images.githubusercontent.com/17079352/203334606-51309918-132b-4ffa-b83a-d61cbcd333bd.png)



   Конфигурации роутеров были сохранены в файлах router1.rsc, router2.rsc.
   
   ![image](https://user-images.githubusercontent.com/17079352/203334890-e066c0ce-e423-4e82-a33c-39e485b9f067.png)
   
   ![image](https://user-images.githubusercontent.com/17079352/203335132-0d9e8d69-eae8-44b6-b5f1-5fa309864fff.png)




   ## Выводы
   Таким образом, были созданы Ansible-плейбуки для конфигурирования роутеров, был изучен протокол динамической маршрутизации OSPF.
 

