function [pomiar, wyliczenia, filtrowanie] = wczytaj_pomiar(nazwa_pliku)
%Funkcja s³u¿¹ca do wczytania do pamiêci pomiarów z programu ManDown
plik = fopen(nazwa_pliku);
pomiar = fscanf(plik, '%d %f %f %f', [4 inf]);
czas_poczatkowy = pomiar(1,1);
wyliczenia = zeros(5, length(pomiar(1,:)));
wyliczenia(1,:) = pomiar(1,:)-czas_poczatkowy;
wyliczenia(2,:) = sqrt(pomiar(2,:).^ 2 + pomiar(3,:).^ 2 + pomiar(4,:).^ 2);
wyliczenia(3,:) = asin(pomiar(2,:)/9.81).*(180/pi());
wyliczenia(4,:) = asin(pomiar(3,:)/9.81).*(180/pi());
wyliczenia(5,:) = asin(pomiar(4,:)/9.81).*(180/pi());
filtrowanie = zeros(5, length(wyliczenia(1,:)));
filtrowanie(1,:) = wyliczenia(1,:);
filtrowanie(:,1:4) = wyliczenia(:,1:4);
for i = 5:length(wyliczenia(1,:))
    filtrowanie(2,i) = mean(wyliczenia(2,i-4:i));
    filtrowanie(3,i) = mean(wyliczenia(3,i-4:i));
    filtrowanie(4,i) = mean(wyliczenia(4,i-4:i));
    filtrowanie(5,i) = mean(wyliczenia(5,i-4:i));
end