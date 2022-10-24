University: [ITMO University](https://itmo.ru/ru/) <br/>
Faculty: [FICT](https://fict.itmo.ru) <br/>
Course: [Network programming](https://github.com/itmo-ict-faculty/network-programming) <br/>
Year: 2022/2023 <br/>
Group: K34202 <br/>
Author: Perov Ivan <br/>
Lab: Lab1 <br/>
Date of create: 24.10.2022 <br/>
Date of finished: x.10.2022 <br/>

# Лабораторная работа №1 "Установка CHR и Ansible, настройка VPN"

## Описание
   Данная работа предусматривает обучение развертыванию виртуальных машин (VM) и системы контроля конфигураций Ansible а также организации собственных VPN серверов.

## Цель работы:
   Целью данной работы является развертывание виртуальной машины на базе платформы Microsoft Azure с установленной системой контроля конфигураций Ansible и установка CHR в VirtualBox

## Ход работы:
   В процессе выполнения лабораторной работы были выпонены следующие шаги:
   
   ### Настройка OpenVPN-сервера на Ubuntu (консольная версия) ###  
   1. Был скачан OpenVPN и EasyRSA.
 
   ![image](https://user-images.githubusercontent.com/17079352/197516522-d72a81c7-c97d-48d7-bc7d-e24526777d0a.png)
   ![image](https://user-images.githubusercontent.com/17079352/197516716-ab7f0dfb-9e50-4f43-ac90-f68200c15f30.png)
   
   2. Создан центр сертификации (далее CA).
   
   ![Untitled](https://user-images.githubusercontent.com/17079352/197516833-2ea33bff-d187-4573-ab58-d5890425f841.png)
   
   3. Был создан серверный ключ и подписан у CA.
   
   ![image](https://user-images.githubusercontent.com/17079352/197517019-e240a5f3-c08b-4283-ac88-8b2bc8c72745.png)
   
   ![image](https://user-images.githubusercontent.com/17079352/197517054-76d1363a-21b3-43d1-bef1-596172fb128a.png)
   
   4. Благодаря протоколу Диффи-Хеллмана, две и более стороны могут получить один секретный ключ, который позволит выстроить защищенный канал связи. Был сгенерирован ключ Диффи-Хеллмана.
   
   ![image](https://user-images.githubusercontent.com/17079352/197517574-b9e56db5-e9bc-464e-af7e-d92d753782b9.png)
   
   5. Был сгенерирован ключ HMAC (один из механизмов проверки целостности информации, позволяющий гарантировать то, что данные, передаваемые или хранящиеся в ненадёжной среде, не были изменены посторонними лицами).
   
   ![image](https://user-images.githubusercontent.com/17079352/197517853-a7809f4e-e09c-4dcb-adf0-637820019518.png)
   
   6. Был сгенерирован ключ для клиента и подписан у СА.

   ![image](https://user-images.githubusercontent.com/17079352/197518167-db90c659-0d00-4034-88a0-3df03f7b3675.png)

   7. Был создан конфигурационный файл.
   
   ![image](https://user-images.githubusercontent.com/17079352/197518281-c2305cd0-62ae-4fd7-b084-b159aa791326.png)
   
   8. Успешно протестирован VPN.
   
   ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7fd050f7-9f48-49f1-9cf4-92e2cefd4ca3/Untitled.png)
   
   9. Создан конфигурационный файл для маршрутизации трафика с vpn сервера в Интернет. А тажке этот файл добавлен в автозагрузку, создав при этом сервис. 
   
   ![image](https://user-images.githubusercontent.com/17079352/197518518-ed08e5d6-64f2-4fd8-8dbf-103b9a7ac5d2.png)

   Промежуточный вывод: дальше ручного создания конфигурации VPN сервера я не пошел, таким способом нужно было бы очень долго прописывать все настройки для клиента. Одногруппники порекомендовали использовать OpenVPN AS и WinBox. Полностью удалил прошлую VM, создал новую и начал настройку с начала.

   1. Для подключения к ВМ по SHH была создана пара ключей c помощью ssh-keygen.

   2. Был создан OpenVPN-сервер и OpenVPN AS.
 
   [<img src="https://user-images.githubusercontent.com/58363643/193832234-a76fdabf-b294-4ea0-ae75-b179b688e50b.png" width="500"/>](https://user-images.githubusercontent.com/58363643/193832234-a76fdabf-b294-4ea0-ae75-b179b688e50b.png)
   
   3. Для изменения конфигурации OpenVPN-сервера и добавления клиентов была использована графическая оболочка в браузере. Использован admin UI.
   
   ![image](https://user-images.githubusercontent.com/17079352/197520282-bd5c0022-5138-4f08-9951-2d0c4cf635df.png)
   
   4. В Network Settings/Protocol был выбран TCP, в Advanced VPN/TLS Control Channel Security было выбрано none.

   ![image](https://user-images.githubusercontent.com/17079352/197520983-c5b0b8c5-fd21-4e88-9d9e-a3e0b63db342.png)
   
   5. В разделе User Managment был создан клиент vanoha и скачан профиль profile.ovpn для настройки OVPN-клиента. 

   6. На Ubuntu была установлена система Ansible (для лабораторной работы №2)
 
   ![image](https://user-images.githubusercontent.com/17079352/197520440-58d292a0-69a9-4531-8bd5-1a2b4d78807f.png)

   ### Настройка OpenVPN-клиента на Mikrotic ###
   
   1. На VirtualBox была создана виртуальная машина с CHR.

   ![image](https://user-images.githubusercontent.com/17079352/197520596-35dff00c-3bb6-47be-a0ea-4b428398f537.png)

   2. Определен ip-адрес Microtic для работы с WinBox.

   3. В WinBox были загружены ключ и сертификат для настройки OpenVPN-клиента, в разделе PPP были выполнены настройки клиента.
   
   ![image](https://user-images.githubusercontent.com/17079352/197522588-911b2fb7-8dec-4da1-a520-6589596609a9.png)
   
   4. VPN-туннель был успешно настроен.
   
   ![image](https://user-images.githubusercontent.com/17079352/197522664-666f1807-d68a-4c3b-a9de-8cc538b6023b.png)


   

## Выводы: ##
В результате была создана виртуальная машина (VM) с установленной системой контроля конфигураций Ansible в Yandex Cloud. Также на локальном ПК была установлена VM с RouterOS. Был настроен VPN туннель между сервером и локальным CHR. Проверено подключение пользователя к VPN серверу.
