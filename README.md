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

### Emulators

| **Tries** | **FFI**        | **Platform**   |
| --------- | -------------- | -------------- |
| 1         | 0:00:00.512545 | 0:00:01.425278 |
| 10        | 0:00:03.886295 | 0:00:11.463585 |
| 100       | 0:00:40.296852 | 0:08:04.139465 |
| 250       | 0:01:36.164535 |                |

### Real devices

| **Tries** | **FFI**        | **Platform**   |
| --------- | -------------- | -------------- |
| 1         | 0:00:00.555221 | 0:00:06.851315 |
| 10        | 0:00:05.070437 | 0:00:21.450812 |
| 100       | 0:00:45.810075 | 0:07:22.773931 |
| 250       | 0:02:17.534859 | 0:18:18.700276 |
