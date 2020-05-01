using Signal
using FFTW
using Plots

f(t) = Signal.sig(40000, 51000, 1, 1, t);

n = 256;
tmax = 2n*pi;
fe = 512000;
δ = 1/fe;

t = Signal.time(n, fe);
y = f.(t);
τ = Signal.τ(n, fe);

c = Signal.corr(y);
e = energy(y);
dsp = Signal.dsp(Signal.padding(y, size(y,1)*4))
fr = (1/size(dsp, 1):1/size(dsp, 1):1.0)*fe;

println("Energy of the signal: ", e)

Plots.gr()
p1 = Plots.plot(t, y,
                title="Signal",
                xlabel="Time (s)")
p2 = Plots.plot(τ, c,
                title="Autocorrelation",
                xlabel="Time shift (s)")
p3 = Plots.plot(p1, p2, layout=(1,2))

p4 = Plots.plot(fr, dsp,
                title="DSP",
                xlabel="Frequency (Hz)")
Plots.plot(p3, p4, layout=(2, 1))
