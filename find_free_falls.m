function edges = find_free_falls(time, values, threshold)
count = 0;
tolerance = 0.1;
edges = [];
begin = 0;
    for i=2:length(values)
    count_inc = (time(i) - time(i-1))/10;
        if(count < threshold)
            if values(i) <= (values(i-1)) && values(i) < 12
                if count == 0
                    begin = time(i-1);
                    min_value = values(i);
                end
                count = count+count_inc;
            elseif values(i) <= values(i-1)
                count = count - 2*count_inc;
                if count < 0
                    count = 0;
                end
            else
                count = 0;
            end
        else
            if values(i) < min_value
                count = count + count_inc;
                min_value = values(i);
            elseif values(i) < min_value + tolerance*2
                count = count + count_inc;
            else
                edges = [edges; [begin, time(i-1)], values(i-1)];
                count = 0;
            end
        end
    end
end