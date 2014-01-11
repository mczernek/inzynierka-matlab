function index = find_angle_index_for_time(angles_with_time, time)
index = 0;
% diff = abs(angles_with_time(1,1) - time);
%     for i=1:length(angles_with_time(:,1))
%         if abs(angles_with_time(i,1) - time) <= diff
%             diff = abs(angles_with_time(i,1) - time);
%             index = i;
%         end
%     end
    while index+1 < length(angles_with_time(:,1)) && angles_with_time(index+1,1) < time
        index = index + 1;
    end
end