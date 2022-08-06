# Initial test results.

## Debug, profile and release APK sizes for FFI and Platform Apps:

### Platform:

1. Debug: 195.7 MB
2. Profile: 121.9 MB
3. Release: 90.6 MB

### FFI:

1. Debug: 204.3 MB
2. Profile: 132.1 MB
3. Release: 101.9 MB

---

## Number of platform/native calls for emulators and real devices

### Phone specs

| **##**                | **Details**                |
| --------------------- | -------------------------- |
| Brand                 | Samsung                    |
| Model                 | Galaxy M31                 |
| Processor Type        | Samsung Exynos 9 Octa 9611 |
| Processor Core        | Octa Core                  |
| Primary Clock Speed   | 2.3 GHz                    |
| Secondary Clock Speed | 1.7 GHz                    |
| Internal Storage      | 64 GB                      |
| RAM                   | 6 GB                       |

### Emulators

| **Tries** | **FFI**        | **Platform**   |
| --------- | -------------- | -------------- |
| 1         | 0:00:00.351160 | 0:00:03.445918 |
| 10        | 0:00:03.994830 | 0:01:17.703339 |
| 100       | 0:00:40.216158 | 0:11:39.253159 |
| 250       | 0:01:45.755812 | 0:33:30.904886 |

### Real devices

| **Tries**             | **FFI**        | **Platform**   |
| --------------------- | -------------- | -------------- |
| 1                     | 0:00:01.055075 | 0:00:08.666869 |
| 10                    | 0:00:05.565126 | 0:01:05.033533 |
| 100                   | 0:01:09.642193 | 0:09:23.732347 |
| 250                   | 0:02:31.766274 | NA             |
| 169(exceptional case) | NA             | 0:20:26.215526 |
