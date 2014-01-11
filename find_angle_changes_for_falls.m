function changes = find_angle_changes_for_falls(free_falls, permanent_angles, max_time)
    begin_times = free_falls(:,1);
    end_times = free_falls(:,2);
    angle_times = permanent_angles(:,1);
    angle_values = permanent_angles(:,2);
    changes = zeros(length(begin_times));
    for i = 1:length(begin_times)
       start_index = find_angle_index_for_time(permanent_angles, begin_times(i));
       if(start_index>0)
           end_index = start_index;
           min_value = angle_values(start_index);
           max_value = angle_values(start_index);

           while angle_times(end_index) < begin_times(i) + max_time && end_index < length(angle_values)
               end_index = end_index + 1;
               %refresh min and max values
               if min_value > angle_values(end_index)
                   min_value = angle_values(end_index);
               end

               if max_value < angle_values(end_index)
                   max_value = angle_values(end_index);
               end
           end
           changes(i) = max_value - min_value;
       else
           changes(i) = 0;
       end
       
       
    end
end