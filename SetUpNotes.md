## Notes on WISE 1049AB Retrievals

### Differences in this script versus standard templates

#### Profile Type 7, Implemented Instrument Mode -> Data file has a fourth column for resolution, Slab + Deck Configurations 

#### Making the templates modular: the use of f("example{component}.txt") allows for you to only change the variable component, make sure to place this updated version of Brewster either in your main directly (if you choose to override the previous stuff) or create a new direction, I placed mine in a folder called Brewster_v1.1 

#### Before running enter the following commands into the terminal within the brewster directory 

##### mkdir ../log_files mkdir outputs/ 
