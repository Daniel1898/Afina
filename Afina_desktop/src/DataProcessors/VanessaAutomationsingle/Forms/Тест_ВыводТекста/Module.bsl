//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
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

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОбратитеВнимание(Парам01)","ОбратитеВнимание","И обратите внимание ""Текст обратите внимание""","Выводит в автовидеоинструкцию нужный текст в виде вставки. Белые буквы на черном фоне.","Прочее.Автоинструкции.Видеовставка.Устаревшее");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВидеоВставка(Парам01,Парам02)","ВидеоВставка",
		"И видеовставка ""ТекстСообщения"" ""ТекстДиктора""",
		"Выводит в автовидеоинструкцию нужный текст в виде вставки. Вставка будет сделана в виде белых букв на черном фоне.
		|Второй параметр ""ТекстДиктора"" необязательный. Если он не указан, то текст диктора и текст вставки указывается в первом параметре.",
		"Прочее.Автоинструкции.Видеовставка");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВидеоВставкаТолькоТекст(Парам01)","ВидеоВставкаТолькоТекст","И видеовставка только текст ""Текст""","Выводит в автовидеоинструкцию нужный текст в виде вставки. Белые буквы на черном фоне. Не озвучивается диктором.","Прочее.Автоинструкции.Видеовставка");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ТекстСубтитров(Парам01)","ТекстСубтитров","Дано текст субтитров ""Текст""","Озвучивает и выводит в автовидеоинструкцию нужный текст в виде субтитров. Субтитры будут если включена опция вывода в видео субтитров. В качестве фона кадра будет взято текущее состояние экрана.","Прочее.Автоинструкции.Видеовставка.Устаревшее");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ТекстДиктора(Парам01)","ТекстДиктора","Дано текст диктора ""Текст""","Озвучивает и выводит в автовидеоинструкцию нужный текст. В видео будут выведены субтитры, если включена опция вывода в видео субтитров. В качестве фона кадра будет взято текущее состояние экрана.","Прочее.Автоинструкции.Видеовставка");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты, "ВидеовставкаКартинки(Парам01,Парам02,ТабПарам)",
		"ВидеовставкаКартинки",
		"И видеовставка картинки ""ИмяКартинки"" ""ТекстДиктора""
		|	|'FadeIn' |'Да'|
		|	|'FadeOut'|'Да'|",
		"Добавляет в видео вставку из указанной картинки с указанным текстом диктора. Можно управлять затемнением в начале и в конце видеовставки с помощью параметров FadeIn и FadeOut. Разрешение картинки должно совпадать с разрешением, в котором идёт запись видео. Имя картинки указывается без расширения. Картинка должна быть в формате png. Файл каратинки должен находиться в каталоге проекта.",
		"Прочее.Автоинструкции.Видеовставка");

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
//Когда обратите внимание "Текст обратите внимание"
//@ОбратитеВнимание(Парам01)
Функция ОбратитеВнимание(ТекстСообщения) Экспорт
	Сообщить(Ванесса.ПолучитьТекстСообщенияПользователю(ТекстСообщения));
КонецФункции

&НаКлиенте
//Когда видео вставка "Текст обратите внимание"
//@ВидеоВставка(Парам01)
Функция ВидеоВставка(ТекстСообщения, ТекстДиктора = Неопределено) Экспорт
	Сообщить(Ванесса.ПолучитьТекстСообщенияПользователю(ТекстСообщения));
КонецФункции

&НаКлиенте
//Когда видео вставка только текст "Текст обратите внимание"
//@ВидеоВставкаТолькоТекст(Парам01)
Функция ВидеоВставкаТолькоТекст(ТекстСообщения) Экспорт
	Сообщить(Ванесса.ПолучитьТекстСообщенияПользователю(ТекстСообщения));
КонецФункции

&НаКлиенте
//Дано текст субтитров "Текст"
//@ТекстСубтитров(Парам01)
Функция ТекстСубтитров(Знач Текст) Экспорт
	Ванесса.СоединитьСтрокиЕслиЭтоВозможно(Текст);
	Ванесса.УстановитьТекстИнструкции(Текст);
КонецФункции

&НаКлиенте
//Дано текст субтитров "Текст"
//@ТекстДиктора(Парам01)
Функция ТекстДиктора(Знач Текст) Экспорт
	ТекстСубтитров(Текст);
КонецФункции


&НаКлиенте
// И видеовставка картинки "Тест"
//@ВидеовставкаКартинки(Парам01)
Функция ВидеовставкаКартинки(ИмяКартинки, ТекстДиктора, ТабПарам = Неопределено) Экспорт
	// Чтобы вызвать исключение, если картинки нет.
	Файл = Ванесса.ПолучитьФайлКартинки(ИмяКартинки); 
КонецФункции

