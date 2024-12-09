
do_save_figures = true;

jump_color = [0.85, 0, 0];
flow_color = [0, 0, 0.8];

% seed = 1
% rng(seed)
flow_lengths = [1.3, 1.9, 0, 0];
htd_example_base = struct();
htd_example_base.J = 2;
htd_example_base.flow_length_fnc = @(j) flow_lengths(j+1);%2*max(0, 0.7-rand());
htd_example_base.title = 'Hybrid Time Domain';
htd_example_base.suffix = '';
htd_example_base.xlim = [0, 3.3];
htd_example_base.save_width = 200;
htd_example_base.save_height = 115;
htd_example_base.suffix = 'base';

htd_example_genuinely_zero = struct();
htd_example_genuinely_zero.J = 30;
htd_example_genuinely_zero.flow_length_fnc = @(j) (0.8)^j;
htd_example_genuinely_zero.title = 'Zeno';
htd_example_genuinely_zero.suffix = 'genuinely_zeno';
htd_example_genuinely_zero.xlim = [0, 6];

htd_example_instananeously_zeno = struct();
htd_example_instananeously_zeno.J = 14;
htd_example_instananeously_zeno.flow_length_fnc = @(j) 0;
htd_example_instananeously_zeno.title = 'Instananeously Zeno';
htd_example_instananeously_zeno.suffix = 'instananeously_zeno';
htd_example_instananeously_zeno.xlim = [-0.1, 0.1];

htd_example_vdt_1 = struct();
htd_example_vdt_1.J = 20;
htd_example_vdt_1.flow_length_fnc = @(j) 1/(1.4*j+1);
htd_example_vdt_1.title = 'Vanishing Dwell-Time';
htd_example_vdt_1.suffix = 'vdt_1';
htd_example_vdt_1.xlim = [0, inf];

htd_example_vdt_2 = htd_example_vdt_1;
htd_example_vdt_2.J = 80;
htd_example_vdt_2.suffix = 'vdt_2';

htd_example_vdt_3 = htd_example_vdt_1;
htd_example_vdt_3.J = 10000;
htd_example_vdt_3.suffix = 'vdt_3';

examplesl = htd_example_base
examples = [ htd_example_genuinely_zero, htd_example_instananeously_zeno, htd_example_vdt_1, htd_example_vdt_2, htd_example_vdt_3];
% flow_length_fnc = @(j) 1/(j+1);
% flow_length_fnc = @(j) max(0, 1-0.3*j);
for i_example = 1:numel(examples)
    
example = examples(i_example);

arc = generateHybridTimeDomain(example.J, example.flow_length_fnc);

figure(i_example); clf
HybridPlotBuilder().title(example.title)...
    .flowColor(flow_color).jumpColor(jump_color)...
    .jumpMarker('.').jumpLineStyle(':')...
    .plotHybrid(arc)
xlim(example.xlim);%[-1, 6])
% ylim('padded')
view(0,90)
% ax = gca();
% ax.YAxis.Scale = "log"

if isfield(example, 'save_width')
    width = example.save_width;
else
    width = 200;
end
if isfield(example, 'save_height')
    height = example.save_height;
else
    height = 250;
end
if do_save_figures
    pwintz.utils.saveFigure('', ['htd_', example.suffix], width, height)
end


if do_save_figures && strcmp(example.suffix, htd_example_base.suffix)
    hpb = HybridPlotBuilder().title(example.title)...
            .flowColor(flow_color).jumpColor(jump_color)...
            .jumpMarker('.').jumpLineStyle(':');
    FIRST_FILE_WITH_FLOW = 2;
    for j = 0:arc.jump_count-1
        file_index = FIRST_FILE_WITH_FLOW + 2*j;

        y_lim_values = [-0.3, 3.3];
        figure(i_example+20); clf
        hpb.plotHybrid(arc.restrictJ([0, j]) )
        xlim(example.xlim);
        ylim(y_lim_values)
        view(0,90)
        pwintz.utils.saveFigure(figure_save_path, sprintf('htd_animation_%d', file_index), width, height)

        file_index = FIRST_FILE_WITH_FLOW + 2*j+1;
        figure(i_example); clf
        hpb.plotHybrid(arc.restrictT([0, arc.jump_times(j+1)]) )
        xlim(example.xlim);
        ylim(y_lim_values)
        view(0,90)        
        pwintz.utils.saveFigure(figure_save_path, sprintf('htd_animation_%d', file_index), width, height)
    end

end


end

function arc = generateHybridTimeDomain(J, flow_length_fnc)
    j_array = nan(2*J, 1);% (0:J)';
    t_array = nan(2*J, 1);%size(j_array));
    j_array(1) = 0;
    t_array(1) = 0;
    j = 0;
    k = 1;
    while j <= J
        t0 = t_array(k);
        tf = t0 + flow_length_fnc(j);
        t_array(k+1) = tf;
        t_array(k+2) = tf;
        j_array(k+1) = j;
        j_array(k+2) = j+1;
        j = j+1;
        k = k+2;
    end
%     for k = 1:(J-1)
%         % k is the index (which starts at '1') and j is the discrete time
%         % (starts at zero).
%         j = k-1;
%         t_array(k+1) = t_array(k) + flow_length_fnc(j);
%     end
    x = zeros(size(j_array));
    arc = HybridArc(t_array, j_array, x);
end