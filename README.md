# PS_Smoke_IvansSaponenko

This is am air simulation particle system.

github link to assignement upload:
www.github.com/Ivansstyle/PS_Smoke_IvansSaponenko/

github link to initial project rep:
www.github.com/Ivansstyle/smoke/

@comment:
    I am really sorry I havent provided any specific information in my code,
    neither I made a doxy file. This was a big mistake due to my lazyness 
    and late project start time. I will commit all comments and doxy in 
    a few days after deadline, all files will be uploaded to the assignement repo.
    I fully understand that I cal loose my marks because of that.
    

Controls:

Arrow Keys ->   ControlSphere movement in x and z axis
lshift------>   ControlSphere movement Up the y axis
lctrl------->   ControlSphere movement Down the y axis
space------->   Emit particles
i ---------->   Set FlowSpace to attract particles to the ControlSphere
o----------->   Set FlowSpace to attract particles from the ControlSphere
s ---------->   Draw the Space (particle and sphere clipper)
f ---------->   Draw the Flows (ControlSphere to Particle interaction element)
r----------->   Delete the particles

Nice variables to play with: 

resolution in ParticleSystem::init

There are 3 defines, which are used to set the Flow size and FLowSpace resolution as well:

RESOLUTION_LQ - is a good resolution to handle a large number of particles while still 
                providing good vectors
RESOLUTION_MQ - better resolution still can handle a large amout of particles, but with more precise vectors

RESOLUTION_HQ - best resolution, providing very correct vector movements, but can be slow. Better handles 
                medium-low particles amounts;

RESOLUTION_UHQ - best possible resolution to render <500 particles real-rime

space.SetSize in ParticleSystem::init and space.SetOrigin in ParticleSystem::init

those 2 variables set up a Space boundaries as well as ParticleSystem origin,
none of the contruction/initialisation values are hard-coded,(except RESOLUTION definitions, but those can be set later) so it is possible to produce
any sized space with any amout of Flows at any origin

Flow::Flow() ctor variables:

m_sphere_attraction_factor()    (def value 5.5f)    - is a factor that controls how much velocity Flows get from a moving ControlSphere 
m_decoy()                       (def value 0.993f)  - is a multiplier to a Flow vectors, sets how fast vector dies out to 0
m_particle_interaction_factor() (def valie 0.001f)  - is a factor that is applied to the Flow -> Particle relationship to set how much velocity particle gets from a vector
m__sphere_interaction_r()       (def value 0.18f)   - is a element of a radius, that sets how big is ControlSphehe -> Flow ineraction radius
m_suck_blow_force()             (def value 0.0002f) - [very delecate value] - sets with what force Flows suck Particles into ControlSphere, or with what force blow them of it

Classes:

ParticleSystem  - the base class for particle system, draws/updates everything, initialises everything, hanldes timers

ParticleSystem has a Controls - class that holds SDL_Event, takes coontrols, uses pointers to Particle System private member in some cases to properly set a bool variable

ParticleSystem has a Space  -  represents simulation field boundaries, collides and sets back particles and cCntrolSphere

Space has a FlowSpace - is a class tat creates, stores, and updates the flows

ParticleSystem has many Particles - particles are just particles 

FLowSpace has many Flows - flow is a cubicle of space with 8 vectors on each vertex. Flow holds many algorithms, and flow i suppose is the main cool element that drives this system

Flow can interact with a particle, by sending an approximation of each of its vector depending on a particle position,(while particle always has a pointer to a flow in which  it is 
located), flow can interact with a ControlSphere by aquiring a controlSphere vector (for now I ise a pretty basic equation, but there is a place for a more extreme implementatiom)
Flow should have been able to interact with neigboring flows to aquire the space equilibrium (see EQUILIBRIUM define in Flow.h) but struggeled a lot to set correct pointer to 
flow friends, I faced a lot of implementation problems. (Such as comparing colls and rows but not segments in an overloaded != operator) And was left with almost no time to calculate 
a relevant algotihm. 

//Future plans:
1) producing a nice Flow -> Flow algorith,
2) changing others flow algorithms for a correct implemintation
3) Adding rotational force to Flows to more correctly simulate aerodynamics
4) offLine renderer
5) shaders





