function angles = find_permanent_angles(time, values, threshold)
count = 1;
angles = [];
mean = values(1);
begin = 0;
tolerance = 1;
    for i=2:length(values)
        count_inc = (time(i) - time(i-1))/10;
         if abs(values(i) - mean) < tolerance
            if count == 1
                begin = time(i);
            end
            count = count + count_inc;
            mean = mean + (values(i)-mean)/count;
         else
             if count > threshold
                cur_angle =  asin(mean/9.81)*180/pi();
                angles = [angles ; begin, cur_angle;time(i-1), cur_angle ];
             end
             count = 1;
             mean = values(i);
         end
    end
end