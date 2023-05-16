
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Automation
Перем Ванесса;

&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;

&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Automation.
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
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавляюКШагуФайлИзСТипом(Парам01, Парам02)","ЯДобавляюКШагуФайлИзСТипом",
		"И Я добавляю к шагу файл из ""ИмяФайла"" с типом ""ТипФайла""",
		"Добавляет файл к текущему шагу. Файл появится в отчете Allure. Также он будет добавлен в список файлов ошибки в формате Json.", "Файлы.Прикрепление файлов к отчету Allure или файлу ошибки в формате Json");
	
	Возврат ВсеТесты;
	
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
//И Я добавляю к шагу файл из "ИмяПеременной" с типом "ТипФайла"
//@ЯДобавляюКШагуФайлИзСТипом(Парам01, Парам02)
Функция ЯДобавляюКШагуФайлИзСТипом(ПолноеИмяФайла, ТипФайла) Экспорт
	
	Ванесса.ДобавитьФайлКШагу(ПолноеИмяФайла, ТипФайла);
	
КонецФункции