module Signal

import FFTW
import WAV
import Plots

function readWAV(filename::String)
  y, fs = WAV.wavread(filename);
  n = size(y, 1);
  y = reshape(y, (n,));
  return (n, y, fs);
end

function energy(signal::Array{Float64, 1})
  transpose(signal) * signal;
end

function corr(signal::Array{Float64, 1})
  N = size(signal, 1);
  Z = zeros(N);
  x = [Z;signal;Z];
  R = zeros(Float64, 2N+1);

  for k in -N+1:N
    R[N+k] = transpose(signal) * x[N+k:2N+k-1];
  end
  return R
end

function tfd(signal::Array{Float64, 1})
end

function dsp(signal::Array{Float64, 1})
  S = FFTW.fft(signal);
  return abs.(S).^2
end

function padding(signal::Array{Float64, 1}, N::Int64)
  return [signal; zeros(N)]
end

function note(freq::Float64)
  return Int64(round(12log2(freq/440) + 69))
end

function freq(note::Int64)
  return 440*2^((note-69)/12)
end

sig(f0, f1, A0, A1, t) = (A0*cos(2pi*f0*t) + A1*sin(2pi*f1*t))
time(N, fe) = (1/fe:1/fe:N/fe)
τ(N, fe) = (-N/fe:1/fe:N/fe)

end # module
