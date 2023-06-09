Функция СоздатьСообщение_Текст(ИмяСообщения, Текст) Экспорт

	Поток = Новый ПотокВПамяти();

	ЗаписьДанных = Новый ЗаписьДанных(Поток);

	 

	// Записать заголовки.

	ЗаписьДанных.ЗаписатьСтроку("Content-Disposition: form-data; name=" + ИмяСообщения);

	ЗаписьДанных.ЗаписатьСтроку("");	 

	// Записать тело.

	ЗаписьДанных.ЗаписатьСтроку(Текст);

	 

	ЗаписьДанных.Закрыть();

	 

	Возврат Поток.ЗакрытьИПолучитьДвоичныеДанные();

 

КонецФункции


Функция ПолучитьJSONИзСтруктуры(Данные) Экспорт 

	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, Данные);	
	
	Попытка
		
		Результат = ЗаписьJSON.Закрыть();	
	
	Исключение
		
		Результат = "";
		
	КонецПопытки;
	
	Возврат Результат;
	
КонецФункции // ПолучитьJSONИзСтруктуры()

Функция ПолучитьСтруктуруИзJSON(Данные) Экспорт 

	Чтение = Новый ЧтениеJSON;
	Чтение.УстановитьСтроку(Данные);
	Попытка
	
		Результат = ПрочитатьJSON(Чтение);
	
	Исключение
		
		Результат = Неопределено;
		
	КонецПопытки;	
	
	Возврат Результат
	
КонецФункции // ПолучитьСтруктуруИзJSON()

Функция УстановитьНаименованиеИдФичи(ТекстСценария, Идентификатор) Экспорт 

	ПозицияНаименования = СтрНайти(ТекстСценария, "Функционал:");	
	
	Результат = ТекстСценария;
	
	Если ПозицияНаименования > 0 Тогда
	
		ПозицияНаименованияКонец = СтрНайти(ТекстСценария, Символы.ПС, ,ПозицияНаименования, 1);
		ЗаменяемаяСтрока = Сред(ТекстСценария,ПозицияНаименования, ПозицияНаименованияКонец - ПозицияНаименования);	
		Результат = СтрЗаменить(ТекстСценария, ЗаменяемаяСтрока, "Функционал: " + Идентификатор);
		
	КонецЕсли;
		
	Возврат Результат;
	
КонецФункции // ()
