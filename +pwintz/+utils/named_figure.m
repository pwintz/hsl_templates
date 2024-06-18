function named_figure(id, name)
    f = figure(id);
    set(f,'Name',name)
    %set(f,'NumberTitle','off')
    clf(f)
end