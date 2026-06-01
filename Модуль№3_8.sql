SELECT 
    S.Id_Specifikacion AS Номер_Заказа,
    P.Name_Product AS Продукция,
    S.Kolvo AS Количество,
    SUM(S.Kolvo * M.Price_Material) AS Себестоимость_1шт,
    S.Kolvo * SUM(S.Kolvo * M.Price_Material) AS Полная_стоимость
FROM Specifikacion S
INNER JOIN Product P ON S.Specifikacion_Product = P.Id_Product
INNER JOIN Specifikacion  ON P.Id_Product = S.Material_Specifikacion  -- INNER JOIN
INNER JOIN Material M ON S.Material_Specifikacion = M.Id_Material
GROUP BY S.Id_Specifikacion, P.Name_Product, S.Kolvo;

