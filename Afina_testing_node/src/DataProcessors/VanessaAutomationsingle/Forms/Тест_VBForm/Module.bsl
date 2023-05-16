//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

// Делает отключение модуля
&НаКлиенте
Функция ОтключениеМодуля() Экспорт

	Ванесса = Неопределено;
	Контекст = Неопределено;
	КонтекстСохраняемый = Неопределено;

КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯНажмаюНаКнопкуVanessa_Behavior(Парам01)","ЯНажмаюНаКнопкуVanessa_Behavior","Когда я нажмаю на кнопку Vanessa-Behavior ""Начать запись поведения""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока(Парам01,Парам02)","ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока","Тогда В реквизите Vanessa-Behavior ""СгенерированныйСценарий"" будет содержаться строка ""ываыва""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВерсияПоставкиВанессыТогда(Парам01)","ВерсияПоставкиВанессыТогда","Если версия поставки Ванессы ""standart"" тогда","","","Условие");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВТекущейСтрокеКлиентовТестированияЯЗаполняюПользователя()","ВТекущейСтрокеКлиентовТестированияЯЗаполняюПользователя","И в текущей строке клиентов тестирования я заполняю пользователя","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавляюТекущемуКлиентуТестированияДопполнительныеПараметры(Парам01)","ЯДобавляюТекущемуКлиентуТестированияДопполнительныеПараметры","И я добавляю текущему клиенту тестирования допполнительные параметры ""/Lru /Vlru""","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОбновляюВремяИзмененияУФайла(Парам01)","ЯОбновляюВремяИзмененияУФайла","И я обновляю время изменения у файла ""ИмяФайла""","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Функция выполняется перед началом каждого сценария
Функция ПередНачаломСценария() Экспорт
	
КонецФункции

&НаКлиенте
// Функция выполняется перед окончанием каждого сценария
Функция ПередОкончаниемСценария() Экспорт
	
КонецФункции



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда я нажмаю на кнопку Vanessa-Behavior "Начать запись поведения"
//@ЯНажмаюНаКнопкуVanessa_Behavior(Парам01)
Функция ЯНажмаюНаКнопкуVanessa_Behavior(ИмяКнопки) Экспорт
	Если ИмяКнопки = "Начать запись поведения" Тогда
		Ванесса.НачатьЗаписьДействийПользователя();
	ИначеЕсли ИмяКнопки = "Закончить запись поведения" Тогда
		Ванесса.ЗавершитьЗаписьДействийПользователя();
	ИначеЕсли ИмяКнопки = "Забыть состояние формы TestClient" Тогда
		Ванесса.ЗабытьСостояниеФормыTestClient();
	ИначеЕсли ИмяКнопки = "ПолучитьИзмененияФормыGherkin" Тогда
		Ванесса.ПолучитьИзмененияФормыGherkin();
	ИначеЕсли ИмяКнопки = "Запомнить состояние формы TestClient" Тогда
		Ванесса.ЗапомнитьСостояниеФормыTestClient();
	Иначе	
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не описано действие для кнопки <%1>");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяКнопки);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли; 
КонецФункции

&НаКлиенте
//Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка "ываыва"
//@ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока(Парам01,Парам02)
Функция ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока(Имяреквизита,ОжидаемаяСтрока) Экспорт
	Поз = Найти(Ванесса.Объект[Имяреквизита],ОжидаемаяСтрока);   
	
	Если Поз = 0 Тогда
		Стр1 = СтрЗаменить(Ванесса.Объект[Имяреквизита],"""","'");
		Стр2 = СтрЗаменить(ОжидаемаяСтрока,"""","'");
		Поз = Найти(Стр1,Стр2);   
	КонецЕсли;	 
	
	Если Поз = 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Строка %1 не найдена в реквизите %2");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ОжидаемаяСтрока);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",Имяреквизита);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли; 
КонецФункции

&НаКлиенте
//Если версия поставки Ванессы "standart" тогда
//@ВерсияПоставкиВанессыТогда(Парам01)
Функция ВерсияПоставкиВанессыТогда(ВерсияПоставки) Экспорт
	Если Ванесса.Объект.ВерсияПоставки = ВерсияПоставки Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе	
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;	 
КонецФункции

&НаКлиенте
//И в текущей строке клиентов тестирования я заполняю пользователя
//@ВТекущейСтрокеКлиентовТестированияЯЗаполняюПользователя()
Функция ВТекущейСтрокеКлиентовТестированияЯЗаполняюПользователя() Экспорт
	ДопПараметры = Ванесса.Элементы.ДанныеКлиентовТестирования.ТекущиеДанные.ДопПараметры;
	Если ПустаяСтрока(ДопПараметры) Тогда
		Ванесса.Элементы.ДанныеКлиентовТестирования.ТекущиеДанные.ДопПараметры = "/N""" + ИмяПользователя() + """";
	КонецЕсли;	 
КонецФункции

&НаКлиенте
//И я добавляю текущему клиенту тестирования допполнительные параметры "/Lru /Vlru"
//@ЯДобавляюТекущемуКлиентуТестированияДопполнительныеПараметры(Парам01)
Функция ЯДобавляюТекущемуКлиентуТестированияДопполнительныеПараметры(ДопПараметры) Экспорт
	Ванесса.Элементы.ДанныеКлиентовТестирования.ТекущиеДанные.ДопПараметры = 
	    Ванесса.Элементы.ДанныеКлиентовТестирования.ТекущиеДанные.ДопПараметры + " " + ДопПараметры;
КонецФункции

&НаКлиенте
//И я обновляю время изменения у файла "ИмяФайла"
//@ЯОбновляюВремяИзмененияУФайла(Парам01)
Функция ЯОбновляюВремяИзмененияУФайла(ИмяФайла) Экспорт
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла,"UTF-8");
	
	Стр = Текст.Прочитать();
		
	Текст.Закрыть();
	
	Ванесса.УдалитьФайлыКомандаСистемы(ИмяФайла);
	
	ЗТ = Новый ЗаписьТекста(ИмяФайла,"UTF-8",,Истина); 
	ЗТ.Записать(Стр); 
	ЗТ.Закрыть();
	
КонецФункции
