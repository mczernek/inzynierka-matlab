[pomiar, wyliczenia, filtrowanie] = wczytaj_pomiar(nazwa_pliku);
katy1 = find_permanent_angles(wyliczenia(1,:), pomiar(2,:), 20);
katy2 = find_permanent_angles(wyliczenia(1,:), pomiar(3,:), 20);
katy3 = find_permanent_angles(wyliczenia(1,:), pomiar(4,:), 20);

%% 1. Rysuj wyliczenia
figure(1);
plot(wyliczenia(1,:), wyliczenia(2,:), 'b-');
ylim([-20 20]);
figure(2);
plot(wyliczenia(1,:), wyliczenia(3,:),'r');
hold on;
plot(katy1(:,1), katy1(:,2), 'ro-');
plot(wyliczenia(1,:), wyliczenia(4,:),'g');
plot(katy2(:,1), katy2(:,2), 'go-');
plot(wyliczenia(1,:), wyliczenia(5,:),'b');
plot(katy3(:,1), katy3(:,2), 'bo-');
ylim([-180 180]);

hold off;

%% 2. Znajdü upadki
free_falls = find_free_falls(wyliczenia(1,:), wyliczenia(2,:), 10);
[angles, falls] = find_human_falls(free_falls, katy1, katy2, katy3);