library(audio)       # For audio handling
library(phonTools)   # For phonetic tools including vowel synthesis
library(tuneR)       # For audio file manipulation and analysis

# Generate a noise signal
noise1 = rnorm(5000, 0, 0.05) * 0.2

# Generate the first synthetic vowel sound with specified formant frequencies, bandwidth,
# duration, fundamental frequency, and sampling frequency
vowel1 = vowelsynth(ffs = c(769.667, 1233.222), fbw = 0.06,
                    dur = 500, f0 = c(117.9), fs = 10000, verify = FALSE,
                    returnSound = FALSE, noise1 = .010, noise2 = .030, power = NULL)

# Generate the second synthetic vowel sound
vowel2 = vowelsynth(ffs = c(657.5, 1174), fbw = 0.06,
                    dur = 500, f0 = c(117.9), fs = 10000, verify = FALSE,
                    returnSound = FALSE, noise1 = .010, noise2 = .030, power = NULL)

# Combine the noise and vowel sounds into a single audio instance
vowels = c(noise1, vowel1, noise1, vowel2, noise1)

# Write the combined sound to a WAV file with a specified sampling frequency
writesound(vowels, filename = "vowelpairs.wav", fs = 10000)
