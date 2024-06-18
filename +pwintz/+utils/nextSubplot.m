function [subplot_start_ndx, subplot_i, sp] = nextSubplot(subplot_n, subplot_sizes, subplot_i, subplot_start_ndx)
    size = subplot_sizes{subplot_i};
    sp = subplot(subplot_n, 1, subplot_start_ndx+(0:(size-1)));
    subplot_start_ndx = subplot_start_ndx+size;
    subplot_i = subplot_i+1;
end