classdef Subplotter < handle
    
   properties
       subplot_sizes cell
   end
   
   properties(Access = private)
       subplot_n
       subplot_start_ndx = 1;
       subplot_i = 1;
   end
   
   methods
       function obj = Subplotter(subplot_sizes)
           obj.subplot_n = sum([subplot_sizes{:}]);
           obj.subplot_sizes = subplot_sizes;
           
           tiledlayout(obj.subplot_n, 1,...
               'TileSpacing','compact', ...
               'Padding', 'compact')
       end
       
       function ax = next(this)
           size = this.subplot_sizes{this.subplot_i};
%            sp = subplot(this.subplot_n, 1, this.subplot_start_ndx+(0:(size-1)));
           ax = nexttile([size, 1]);
           this.subplot_start_ndx = this.subplot_start_ndx+size;
           this.subplot_i = this.subplot_i+1;
       end
   end
    
end