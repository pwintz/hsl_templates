function saveExampleFigure(filename, width, height)
global EXAMPLES_SAVE_PATH
path = fullfile(EXAMPLES_SAVE_PATH, filename);
path_preview = fullfile(EXAMPLES_SAVE_PATH, filename + "_preview");

if ~exist('width', 'var') || isempty(width)
    width = 300;
end
if ~exist('height', 'var')
   height = 250; 
end

% pos = [400, 200] + rand(1, 2) * 300;
fig = gcf();

if strcmp(get(fig, 'WindowStyle'), 'docked')
    warning('Figure is docked, skipping saving')
    return
end

previous_position = get(fig, "position");

set(fig,'WindowStyle','normal')
set(fig, "position", [previous_position(1:2), width, height])

saveas(fig, path_preview, "png")

% Draw a white rectangle around the figure to force the saved PDF to have a
% margin.
annotation('rectangle', [0 0 1 1], 'Color','w')
exportgraphics(fig, path + ".pdf", 'ContentType','vector', 'BackgroundColor','none')
% exportgraphics(fig, path + ".png", 'BackgroundColor','none')
savefig(fig, path + ".fig", 'compact')
% web(path + ".pdf")
% close
    
end