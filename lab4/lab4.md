University: [ITMO University](https://itmo.ru/ru/) <br/>
Faculty: [FICT](https://fict.itmo.ru) <br/>
Course: [Network programming](https://github.com/itmo-ict-faculty/network-programming) <br/>
Year: 2022/2023 <br/>
Group: K34202 <br/>
Author: Perov Ivan <br/>
Lab: 4 <br/>
Date of create: 07.12.2022 <br/>
Date of finished: 13.12.2022 <br/>

# Лабораторная работа №4 "Базовая 'коммутация' и туннелирование используя язык программирования P4"

## Описание
   В данной лабораторной работе ознакомлены на практике с языком программирования P4, разработанный компанией Barefoot (ныне Intel) для организации процесса обработки сетевого трафика на скорости чипа. Barefoot разработал несколько FPGA чипов для обработки трафика которые были встроенны в некоторые модели коммутаторов Arista и Brocade.
   
## Цель работы:
   Изучить синтаксис языка программирования P4 и выполнить 2 задания обучающих задания от Open network foundation для ознакомления на практике с P4.

## Ход работы:
   
   1. Установлен Vagrant, а также склонирован репозиторий с заданиями https://github.com/p4lang/tutorials.
   
   ![image](https://user-images.githubusercontent.com/17079352/207238013-0369be06-c492-457a-89dd-6e9e6c7f96ff.png)
   
   2. Создана виртуальная машина с помощью команды vagrant up. Возникла проблема - отсутствовал user p4. Поэтому пришлось использовать другую виртуальную машину с GitHub https://github.com/jafingerhut/p4-guide/blob/master/bin/README-install-troubleshooting.md
   ![image](https://user-images.githubusercontent.com/17079352/207238076-110b90f9-309a-471c-90bf-42e14c21fd6e.png)
   
   3. Выполнен вход под учетной записью p4/p4.
   
   4. Выполнена команда make run, а затем проверена доступность узлов. Как мы видим, сейчас узлы недоступны, что и нужно будет исправить.
   
   [<img src="https://user-images.githubusercontent.com/58363643/203771569-fadf3c1a-a429-4789-bb29-d71797a801cd.png" width="400"/>](https://user-images.githubusercontent.com/58363643/203771569-fadf3c1a-a429-4789-bb29-d71797a801cd.png)
   
   5. Был изменен файл basic.p4:
   - Обновлен парсер, который позволяет заполнять заголовки ethernet_t, ipv4_t.
   
   ![image](https://user-images.githubusercontent.com/17079352/207239258-fe06c5cd-405f-431a-98c7-f700f575dd0e.png)
   
   - В MyIngress дополнено action ip4_forward: был определен выходной порт, обновлен адрес назначения пакета, обновлен источник отправления пакета, уменьшено значение TTL.
   
   ![image](https://user-images.githubusercontent.com/17079352/207239360-140456e8-654c-4355-86a7-28b5079f171c.png)

   - Обеспечено применение ipv4_lpm, если заголовок ipv4 верный.
   
   ![image](https://user-images.githubusercontent.com/17079352/207239521-3c05dd60-d1c9-4502-b801-aa0a7cc3b524.png)

   
   6. Выполнена проверка скрипта.
   
   [<img src="https://user-images.githubusercontent.com/58363643/203789865-4d61e360-4800-47fb-bd53-30f23149e1a0.png" width="400"/>](https://user-images.githubusercontent.com/58363643/203789865-4d61e360-4800-47fb-bd53-30f23149e1a0.png)
   
   7. Теперь приступаем ко второй части лабораторной работы. А именно к созданию туннелирования.
   8. Изменен файл basic_tunnel.p4: </br>
   - Обновлен парсер myParser, а именно, добавлена функция заполненения заголовка myTunnel.
   
   ![image](https://user-images.githubusercontent.com/17079352/207239917-4b51f6b8-29f4-4c01-a2f6-8bc118e47e2f.png)
   
   - Определено действие myTunnel_forward, которое назначает выходной порт.
   
   ![image](https://user-images.githubusercontent.com/17079352/207239966-d5e227e4-b58c-42d4-813b-8e8a8181ddf3.png)

   - Определена таблица myTunnel_exact.
   
   ![image](https://user-images.githubusercontent.com/17079352/207240034-2918b8e6-978b-4edd-b0cc-2605e738d2fa.png)
   
   - Обновлено выражение apply. Оно позволяет применять myTunnel_exact, если заголовок myTunell валидный.
   
   ![image](https://user-images.githubusercontent.com/17079352/207241529-027e5c0c-85e7-4c5f-ac0b-9878483be334.png)
   
   - Был обновлен MyDeparser
   
   ![image](https://user-images.githubusercontent.com/17079352/207240294-ecec087c-73ad-4f9a-be84-4c895dcc288b.png)


   9. Проверена локальная связность.
   
   [<img src="https://user-images.githubusercontent.com/58363643/203813294-318b9937-1289-43ee-b54d-3a46147d5b01.png" width="400"/>](https://user-images.githubusercontent.com/58363643/203813294-318b9937-1289-43ee-b54d-3a46147d5b01.png)

   10. Выполнена проверка скрипта, с h1 был оправлен пакет на h2 без туннелирования.
   
   [<img src="https://user-images.githubusercontent.com/58363643/203809425-de4a23ee-a64a-4d3b-bb8a-2af3e1ca9fd9.png" width="400"/>](https://user-images.githubusercontent.com/58363643/203809425-de4a23ee-a64a-4d3b-bb8a-2af3e1ca9fd9.png)
   
   [<img src="https://user-images.githubusercontent.com/58363643/203809627-c281b2ba-fdf8-4686-b2c2-a1359143ddf2.png" width="400"/>](https://user-images.githubusercontent.com/58363643/203809627-c281b2ba-fdf8-4686-b2c2-a1359143ddf2.png)

   11. Теперь проверим работу туннеля. Отправлен пакет с h1 на h2 через туннель. Как мы видим, пакет дошел до получателя с верным сообщением.
   
   [<img src="https://user-images.githubusercontent.com/58363643/203812942-6a4c60aa-759a-4395-bd9d-af7da28b8cb5.png" width="800"/>](https://user-images.githubusercontent.com/58363643/203812942-6a4c60aa-759a-4395-bd9d-af7da28b8cb5.png)

## Выводы
Было детально разобрано стандартное перенаправление пакетов, а также туннелирование, и данные механизмы реализованы посредством языка P4.


![image](https://user-images.githubusercontent.com/17079352/207258516-dfa6e91d-c9ee-40b2-809a-542c115e14da.png)

   

   



