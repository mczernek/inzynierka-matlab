function [angles_for_falls, fall_moments] = find_human_falls(free_falls, x_permanents, y_permanents, z_permanents)
fall_times = free_falls(:,2) - free_falls(:,1);
min_fall_values = free_falls(:,3);
time_tolerance = 1200;
fall_moments = zeros(1, length(fall_times));
x_angles_for_falls = find_angle_changes_for_falls(free_falls, x_permanents, time_tolerance);
y_angles_for_falls = find_angle_changes_for_falls(free_falls, y_permanents, time_tolerance);
z_angles_for_falls = find_angle_changes_for_falls(free_falls, z_permanents, time_tolerance);
angles_for_falls = zeros(1, length(fall_times));
    for i = 1:length(fall_times) 
        changes_sum = x_angles_for_falls(i);
        changes_sum = changes_sum + y_angles_for_falls(i);
        changes_sum = changes_sum + z_angles_for_falls(i);
        angles_for_falls(i) = changes_sum;
        if changes_sum > 110 && min_fall_values(i) < 4;
            fall_moments(i) = 1;
            echo on
            'Human fall detected at moment: '
            free_falls(i,1)
            echo off;
        else
            fall_moments(i) = 0;
        end;
    end
end