
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
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗадаюТаблицуСтрок(Парам01,ТабПарам)","ЯЗадаюТаблицуСтрок","Дано Я задаю таблицу строк ""ТаблицаИсключений""" + Символы.ПС + "| 'Товар1' |" + Символы.ПС + "| 'Товар2' |","Создает в памяти таблицу строк по переданной таблице","Переменные.Сохранить значение.Временная таблица");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоЗначенияИзМассива(Парам01,Парам02)","ДляКаждогоЗначенияИзМассива","И для каждого значения ""ЗначениеИзМассива"" из массива ""МассивЗначенийЧерезТочкуСЗапятой""","Цикл. Перебирает массив значений. Значения переменной в массиве разделяются символом "";"". Параметр ""ЗначениеИзМассива"" - это имя переменной, которое будет доступно в Контексте во время перебора массива значений. Параметр ""МассивЗначенийЧерезТочкуСЗапятой"" - значение массива. В этот параметр передавать можно как строку значений, разделённых символом "";"", так и переменную, в которой содержатся значения, разделённые символом "";"". В последнем случае параметр нужно указывать так: ""$ИмяПеременной$"".","Прочее.Перебор массива","Цикл");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоЗначенияИзТаблицыВПамяти(Парам01,Парам02)",
	"ДляКаждогоЗначенияИзТаблицыВПамяти",
	"И для каждого значения ""ЗначениеИзТаблицы"" из таблицы в памяти ""Коллекция""",
	"Цикл. Перебирает значение из указанной переменной. Первый параметр - это имя переменной, которое будет доступно в Контексте.
	|Второй параметр, имя таблицы, которая сохранена в контексте." + Символы.ПС 
	+ "Если в переданной таблице одна колонка - тогда она интерпретируется как массив. Иначе - как таблица, где в первой строке указаны имена колонок. 
	|По мере перебора строк таблицы будут обновляться значения в переменной Контекст, где именем переменной будет имя колонки. 
	|Использовать значение переменной в других шагах нужно так: $ИмяНужнойКолонки$.
	|Имя колонки должно соответствовать правилам образования ключей структуры."
	,"Прочее.Перебор массива","Цикл");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоФайлаИзКаталога(Парам01,Парам02)","ДляКаждогоФайлаИзКаталога",
		"И для каждого файла ""ТекущийФайл"" из каталога ""ИмяКаталога""",
		"Цикл. Делает перебор файлов в каталоге, исключая подкаталоги. В переменную ""ТекущийФайл"" будет помещен полный путь к файлу. Также создаёт переменные:  _Имя, _ПолноеИмя, _ИмяБезРасширения, _Путь, _Расширение.",
		"Файлы.Перебор файлов",
		"Цикл");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоФайлаИзКаталогаВключаяПодкаталоги(Парам01,Парам02)","ДляКаждогоФайлаИзКаталогаВключаяПодкаталоги",
		"И для каждого файла ""ТекущийФайл"" из каталога ""ИмяКаталога"" включая подкаталоги",
		"Цикл. Делает перебор файлов в каталоге, включая подкаталоги. В переменную ""ТекущийФайл"" будет помещен полный путь к файлу. Также создаёт переменные:  _Имя, _ПолноеИмя, _ИмяБезРасширения, _Путь, _Расширение.",
		"Файлы.Перебор файлов",
		"Цикл");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСохраняюИмяФайлаИзПеременнойКак(Парам01,Парам02)","ЯСохраняюИмяФайлаИзПеременнойКак",
		"Затем я сохраняю имя файла из переменной ""ПолноеИмяФайла"" как ""ИмяФайла""",
		"Получает имя файла из переменной, в которой хранится полный путь к файлу",
		"Файлы.Запомнить имя файла");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСохраняюИмяФайлаБезРасширенияИзПеременнойКак(Парам01,Парам02)",
		"ЯСохраняюИмяФайлаБезРасширенияИзПеременнойКак","Затем я сохраняю имя файла без расширения из переменной ""ПолноеИмяФайла"" как ""ИмяФайла""",
		"Получает имя файла без расширения из переменной, в которой хранится полный путь к файлу",
		"Файлы.Запомнить имя файла");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ДляКаждогоЗначенияИзФайлаJson(Парам01)",
		"ДляКаждогоЗначенияИзФайлаJson",
		"И для каждого значения из файла Json ""ИмяФайла""",
		"Предполагается, что в файле в формате json находится массив стркутур. Создает переменную для каждого значения структуры.",
		"Файлы.Перебор массива из json файла",
		"Цикл");
	
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
//И для каждого значения "ЗначениеИзМассива" из массива "МассивЗначенийЧерезТочкуСЗапятой"
//@ДляКаждогоЗначенияИзМассива(Парам01,Парам02)
Функция ДляКаждогоЗначенияИзМассива(Знач ИмяПеременной,Знач ЗначенияДляПеребора) Экспорт
	
	ИмяПеременной = Ванесса.УбратьЗапрещенныеСимволыИзКлючаСтруктуры(ИмяПеременной);
	
	ИмяЦикла = "_Цикл_" + Формат(Ванесса.ПолучитьСостояниеVanessaAutomation().ТекущийШаг.ИдСтроки, "ЧГ=; ЧН=0");
	Если НЕ Контекст.Свойство(ИмяЦикла) Тогда
		Контекст.Вставить(ИмяЦикла,-1);
	КонецЕсли;	 
	
	Если Контекст.Свойство("ЗавершитьВыполнениеЦикла") Тогда
		Если Контекст.ЗавершитьВыполнениеЦикла = Истина Тогда
			Контекст.ЗавершитьВыполнениеЦикла = Ложь;
			Ванесса.УстановитьРезультатУсловия(Ложь);
			Если Контекст.Свойство(ИмяЦикла) Тогда
				Контекст.Удалить(ИмяЦикла);
			КонецЕсли;	 
			
			Возврат Неопределено;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Контекст[ИмяЦикла] = Контекст[ИмяЦикла] + 1;
	Если ТипЗнч(ЗначенияДляПеребора) = Тип("Строка") Тогда
		МассивЗначений = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(ЗначенияДляПеребора,";");
	ИначеЕсли ТипЗнч(ЗначенияДляПеребора) = Тип("Массив") Тогда
		МассивЗначений = ЗначенияДляПеребора;
	Иначе	
		МассивЗначений = ЗначенияДляПеребора;
	КонецЕсли;	 
	
	Если МассивЗначений.Количество()-1 < Контекст[ИмяЦикла] Тогда
		//значит цикл закончился
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Контекст.Удалить(ИмяЦикла);
		Возврат Неопределено;
	КонецЕсли;	 
	
	Контекст.Вставить(ИмяПеременной,МассивЗначений[Контекст[ИмяЦикла]]);
	Ванесса.УстановитьРезультатУсловия(Истина);
КонецФункции


&НаКлиенте
//И для каждого значения "ЗначениеИзМассива" из таблицы в памяти "МассивЗначенийЧерезТочкуСЗапятой"
//@ДляКаждогоЗначенияИзТаблицыВПамяти(Парам01,Парам02)
Функция ДляКаждогоЗначенияИзТаблицыВПамяти(Знач ИмяПеременной,ИмяТаблицы) Экспорт
	ИмяПеременной = Ванесса.УбратьЗапрещенныеСимволыИзКлючаСтруктуры(ИмяПеременной);
	ИмяЦикла = "_Цикл_" + ИмяПеременной;//тут будет храниться счетчик
	
	Если Контекст.Свойство("ЗавершитьВыполнениеЦикла") Тогда
		Если Контекст.ЗавершитьВыполнениеЦикла = Истина Тогда
			Контекст.ЗавершитьВыполнениеЦикла = Ложь;
			Ванесса.УстановитьРезультатУсловия(Ложь);
			Если Контекст.Свойство(ИмяЦикла) Тогда
				Контекст.Удалить(ИмяЦикла);
			КонецЕсли;	 
			
			Возврат Неопределено;
		КонецЕсли;	 
	КонецЕсли;	
	
	МассивЗначений = Неопределено;
	Если НЕ Контекст.Свойство(ИмяТаблицы, МассивЗначений) Тогда
		КонтекстСохраняемый.Свойство(ИмяТаблицы, МассивЗначений);
	КонецЕсли;
	Если МассивЗначений = Неопределено Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Таблица в памяти с именем <%1> не найдена.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения, "%1", ИмяТаблицы);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;
	
	ЭтоМассив = Истина;
	Если МассивЗначений.Количество() > 0 Тогда
		Если ТипЗнч(МассивЗначений[0]) = Тип("Структура") Тогда
			//значит это передана таблица с несколькими колонками
			//в первой строке хранятся имена переменных
			ЭтоМассив = Ложь;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Если НЕ Контекст.Свойство(ИмяЦикла) Тогда
		Если ЭтоМассив Тогда
			Контекст.Вставить(ИмяЦикла,-1);
		Иначе
			//т.к. в первой строке имена колонок
			Контекст.Вставить(ИмяЦикла,0);
		КонецЕсли;	 
	КонецЕсли;	 
	
	Контекст[ИмяЦикла] = Контекст[ИмяЦикла] + 1;
	
	Если МассивЗначений.Количество()-1 < Контекст[ИмяЦикла] Тогда
		//значит цикл закончился
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Контекст.Удалить(ИмяЦикла);
		Возврат Неопределено;
	КонецЕсли;	 
	
	Если ЭтоМассив Тогда
		Контекст.Вставить(ИмяПеременной,МассивЗначений[Контекст[ИмяЦикла]]);
	Иначе
		СтрокаКолонок    = МассивЗначений[0];
		ТекСтрокаТаблицы = МассивЗначений[Контекст[ИмяЦикла]];
		КлючиТаблицыСокр = Новый Соответствие;
		Для Каждого Элем Из ТекСтрокаТаблицы Цикл
			КлючиТаблицыСокр.Вставить(Ванесса.УбратьЗапрещенныеСимволыИзКлючаСтруктуры(Элем.Ключ), Элем.Ключ);
		КонецЦикла;	 
		
		Для Каждого ЭлементСтруктуры Из СтрокаКолонок Цикл
			ИмяПеременной = ЭлементСтруктуры.Значение;
			ИмяПеременной = Ванесса.УбратьЗапрещенныеСимволыИзКлючаСтруктуры(ИмяПеременной);
			Значение = ТекСтрокаТаблицы[ЭлементСтруктуры.Ключ];
			Если Значение = Неопределено Тогда
				//если в таблице была колонка с заголовком, в котором были символы, запрещенные для ключа структуры
				Значение = ТекСтрокаТаблицы[КлючиТаблицыСокр[ЭлементСтруктуры.Ключ]];
			КонецЕсли;	 
			Контекст.Вставить(ИмяПеременной, Значение);
		КонецЦикла;	
	КонецЕсли;	 
	Ванесса.УстановитьРезультатУсловия(Истина);
КонецФункции


&НаКлиенте
//Дано Я задаю таблицу строк "ТаблицаИсключений"
//@ЯЗадаюТаблицуСтрок(Парам01,ТабПарам)
Функция ЯЗадаюТаблицуСтрок(ИмяТаблицыВПамяти,ТабПарам) Экспорт
	//ТабПарам = Ванесса.ПолучитьЗначенияТаблицыGherkinИзКонтекста(ТабПарам);
	
	Ванесса.ПроверитьЗапретПерезаписиКонтекста(ИмяТаблицыВПамяти);
	
	Массив = Новый Массив;
	
	ЭтоМассив = Истина;
	Если ТабПарам.Количество() > 0 Тогда
		Если ТабПарам[0].Количество() >  1 Тогда
			//значит это передана таблица с несколькими колонками
			//в первой строке хранятся имена переменных
			ЭтоМассив = Ложь;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Для Каждого СтрокаТабПарам Из ТабПарам Цикл
		Если ЭтоМассив Тогда
			Массив.Добавить(СтрокаТабПарам.Кол1);
		Иначе	
			Массив.Добавить(СтрокаТабПарам);
		КонецЕсли;	 
	КонецЦикла;	
	
	Контекст.Вставить(ИмяТаблицыВПамяти,Массив);
КонецФункции

&НаКлиенте
Функция ДляКаждогоФайлаИзКаталогаСлужебный(ИмяПеременной,ИмяКаталога,ВключатьПодкаталоги)
	Если Не Ванесса.ФайлСуществуетКомандаСистемы(ИмяКаталога) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Каталог <%1> не найден.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяКаталога);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	ИмяПеременной = Ванесса.УбратьЗапрещенныеСимволыИзКлючаСтруктуры(ИмяПеременной);
	ИмяЦикла   = "_Цикл_" + ИмяПеременной;//тут будет храниться счетчик
	
	Если Контекст.Свойство("ЗавершитьВыполнениеЦикла") Тогда
		Если Контекст.ЗавершитьВыполнениеЦикла = Истина Тогда
			Контекст.ЗавершитьВыполнениеЦикла = Ложь;
			Ванесса.УстановитьРезультатУсловия(Ложь);
			Если Контекст.Свойство(ИмяЦикла) Тогда
				Контекст.Удалить(ИмяЦикла);
			КонецЕсли;	 
			
			Возврат Неопределено;
		КонецЕсли;	 
	КонецЕсли;
	
	ИмяМассива = "Массив_" + ИмяПеременной;
	Если НЕ Контекст.Свойство(ИмяЦикла) Тогда
		СписокКаталогов = Новый СписокЗначений;
		СписокФайлов    = Новый СписокЗначений;
		Ванесса.НайтиФайлыКомандаСистемы(ИмяКаталога,СписокКаталогов,СписокФайлов,ВключатьПодкаталоги);
		
		Если СписокФайлов.Количество() = 0 Тогда
			Ванесса.УстановитьРезультатУсловия(Ложь);
			Возврат Неопределено;
		КонецЕсли;	 
		
		МассивФайлов = Новый Массив;
		Для Каждого Элем Из СписокФайлов Цикл
			МассивФайлов.Добавить(Элем.Значение.ПолноеИмя);
		КонецЦикла;	
		
		Контекст.Вставить(ИмяЦикла,-1);
		Контекст.Вставить(ИмяМассива,МассивФайлов);
	КонецЕсли;	 
	
	
	Контекст[ИмяЦикла] = Контекст[ИмяЦикла] + 1;
	МассивФайлов       = Контекст[ИмяМассива];
	
	Если МассивФайлов.Количество()-1 < Контекст[ИмяЦикла] Тогда
		//значит цикл закончился
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Контекст.Удалить(ИмяЦикла);
		Контекст.Удалить(ИмяМассива);
		Возврат Неопределено;
	КонецЕсли;	 
	
	Ванесса.Отладка("Обрабатываю файл: " + МассивФайлов[Контекст[ИмяЦикла]]);
	
	Контекст.Вставить(ИмяПеременной,МассивФайлов[Контекст[ИмяЦикла]]);
	
	Файл = Новый Файл(МассивФайлов[Контекст[ИмяЦикла]]);
	
	Если Ванесса.Объект.ЯзыкГенератораGherkin <> "ru" И ЗначениеЗаполнено(Ванесса.Объект.ЯзыкГенератораGherkin) Тогда
		Контекст.Вставить("_Name",Файл.Имя);
		Контекст.Вставить("_NameWithoutExtension",Файл.ИмяБезРасширения);
		Контекст.Вставить("_FullName",Файл.ПолноеИмя);
		Контекст.Вставить("_Path",Файл.Путь);
		Контекст.Вставить("_Extenstion",Файл.Расширение);
	Иначе	
		Контекст.Вставить("_Имя",Файл.Имя);
		Контекст.Вставить("_ИмяБезРасширения",Файл.ИмяБезРасширения);
		Контекст.Вставить("_ПолноеИмя",Файл.ПолноеИмя);
		Контекст.Вставить("_Путь",Файл.Путь);
		Контекст.Вставить("_Расширение",Файл.Расширение);
	КонецЕсли;	 
	
	
	Ванесса.УстановитьРезультатУсловия(Истина);
КонецФункции 

&НаКлиенте
//И для каждого файла "ТекФайл" из каталога "C:\Temp\Video"
//@ДляКаждогоФайлаИзКаталога(Парам01,Парам02)
Функция ДляКаждогоФайлаИзКаталога(Знач ИмяПеременной,ИмяКаталога) Экспорт
	ДляКаждогоФайлаИзКаталогаСлужебный(ИмяПеременной,ИмяКаталога,Ложь);
КонецФункции

&НаКлиенте
//И для каждого файла "ТекФайл" из каталога "C:\Temp\Video" включая подкаталоги
//@ДляКаждогоФайлаИзКаталогаВключаяПодкаталоги(Парам01,Парам02)
Функция ДляКаждогоФайлаИзКаталогаВключаяПодкаталоги(Знач ИмяПеременной,ИмяКаталога) Экспорт
	ДляКаждогоФайлаИзКаталогаСлужебный(ИмяПеременной,ИмяКаталога,Истина);
КонецФункции

&НаКлиенте
//Затем я сохраняю имя файла из переменной "ПолноеИмяФайла" как "ИмяФайла"
//@ЯСохраняюИмяФайлаИзПеременнойКак(Парам01,Парам02)
Функция ЯСохраняюИмяФайлаИзПеременнойКак(ПеременнаяПолныйПутьКФайлу,ИмяПеременной) Экспорт
	Если Не Контекст.Свойство(ПеременнаяПолныйПутьКФайлу) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Переменная <%1> не найдена.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ПеременнаяПолныйПутьКФайлу);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Файл = Новый Файл(ПеременнаяПолныйПутьКФайлу);
	
	Ванесса.СохранитьЗначениеПеременнойВКонтекст(ИмяПеременной,Файл.Имя);
КонецФункции

&НаКлиенте
//Затем я сохраняю имя файла без расширения из переменной "ПолноеИмяФайла" как "ИмяФайла"
//@ЯСохраняюИмяФайлаБезРасширенияИзПеременнойКак(Парам01,Парам02)
Функция ЯСохраняюИмяФайлаБезРасширенияИзПеременнойКак(ПеременнаяПолныйПутьКФайлу,ИмяПеременной) Экспорт
	Если Не Контекст.Свойство(ПеременнаяПолныйПутьКФайлу) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Переменная <%1> не найдена.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ПеременнаяПолныйПутьКФайлу);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Файл = Новый Файл(Контекст[ПеременнаяПолныйПутьКФайлу]);
	
	Ванесса.СохранитьЗначениеПеременнойВКонтекст(ИмяПеременной, Файл.ИмяБезРасширения);
КонецФункции

&НаКлиенте
//И для каждого значения из файла Json "ИмяФайла"
//@ДляКаждогоЗначенияИзФайлаJson(Парам01)
Функция ДляКаждогоЗначенияИзФайлаJson(ИмяФайла) Экспорт
	
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(ИмяФайла) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Файл <%1> не найден.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения, "%1", ИмяФайла);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	
	
	СостояниеVA = Ванесса.ПолучитьСостояниеVanessaAutomation();
	ИдСтроки                 = СостояниеVA.ТекущийШаг.ИдСтроки;
	ИмяЦикла                 = "_Цикл_" + Формат(ИдСтроки, "ЧГ=; ЧН=0");
	ИмяСвойстваЦикла         = "_Цикл_Свойства" + Формат(ИдСтроки, "ЧГ=; ЧН=0");
	
	Если Контекст.Свойство("ЗавершитьВыполнениеЦикла") Тогда
		Если Контекст.ЗавершитьВыполнениеЦикла = Истина Тогда
			Контекст.ЗавершитьВыполнениеЦикла = Ложь;
			Ванесса.УстановитьРезультатУсловия(Ложь);
			Если Контекст.Свойство(ИмяЦикла) Тогда
				Контекст.Удалить(ИмяЦикла);
			КонецЕсли;	 
			Если Контекст.Свойство(ИмяСвойстваЦикла) Тогда
				Контекст.Удалить(ИмяСвойстваЦикла);
			КонецЕсли;	 
			
			Возврат Неопределено;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Если НЕ Контекст.Свойство(ИмяЦикла) Тогда
		
		Текст = Новый ЧтениеТекста;
		Текст.Открыть(ИмяФайла, "UTF-8");
		ТекстФайла = Текст.Прочитать();
		Текст.Закрыть();
		
		ДанныеФайла = Ванесса.ПрочитатьОбъектJSON(ТекстФайла);
		КоличествоИтераций = ДанныеФайла.Количество();
		
		//при запуске первой итерации определяем параметры окончания
		Контекст.Вставить(ИмяЦикла,Истина);
		СвойстваЦикла = Новый Структура;
		ТекущийНомерИтерации = 0;
		МаксЧислоИтераций    = КоличествоИтераций;
		СвойстваЦикла.Вставить("ТекущийНомерИтерации", ТекущийНомерИтерации);
		СвойстваЦикла.Вставить("МаксЧислоИтераций", МаксЧислоИтераций);
		СвойстваЦикла.Вставить("ДанныеФайла", ДанныеФайла);
		Контекст.Вставить(ИмяСвойстваЦикла, СвойстваЦикла);
		
	КонецЕсли;	 
	
	СвойстваЦикла = Контекст[ИмяСвойстваЦикла];
	
	СвойстваЦикла.ТекущийНомерИтерации = СвойстваЦикла.ТекущийНомерИтерации + 1;
	Если СвойстваЦикла.ТекущийНомерИтерации > СвойстваЦикла.МаксЧислоИтераций Тогда
		Ванесса.УстановитьРезультатУсловия(Ложь);
		
		Если Контекст.Свойство(ИмяЦикла) Тогда
			Контекст.Удалить(ИмяЦикла);
		КонецЕсли;	 
		Если Контекст.Свойство(ИмяСвойстваЦикла) Тогда
			Контекст.Удалить(ИмяСвойстваЦикла);
		КонецЕсли;	 
		
		Возврат Неопределено;
	КонецЕсли;	 
	
	ТекЗначение = СвойстваЦикла["ДанныеФайла"][СвойстваЦикла.ТекущийНомерИтерации - 1];
	Для Каждого КлючЗначение Из ТекЗначение Цикл
		Контекст.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
	КонецЦикла;	
	
	Ванесса.УстановитьРезультатУсловия(Истина);
	
	
КонецФункции
