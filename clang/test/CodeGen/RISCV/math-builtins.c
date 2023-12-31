// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py UTC_ARGS: --version 3
// RUN: %clang_cc1 -triple riscv32 -emit-llvm %s -o - | FileCheck --check-prefix=RV32 %s
// RUN: %clang_cc1 -triple riscv64 -emit-llvm %s -o - | FileCheck --check-prefix=RV64 %s

float ceilf(float);
double ceil(double);
long double ceill(long double);
float copysignf(float, float);
double copysign(double, double);
long double copysignl(long double, long double);
float cosf(float);
double cos(double);
long double cosl(long double);
float expf(float);
double exp(double);
long double expl(long double);
float exp2f(float);
double exp2(double);
long double exp2l(long double);
float fabsf(float);
double fabs(double);
long double fabsl(long double);
float floorf(float);
double floor(double);
long double floorl(long double);
float fmaxf(float, float);
double fmax(double, double);
long double fmaxl(long double, long double);
float fminf(float, float);
double fmin(double, double);
long double fminl(long double, long double);
float fmodf(float, float);
double fmod(double, double);
long double fmodl(long double, long double);
float logf(float);
double log(double);
long double logl(long double);
float log10f(float);
double log10(double);
long double log10l(long double);
float log2f(float);
double log2(double);
long double log2l(long double);
float nearbyintf(float);
double nearbyint(double);
long double nearbyintl(long double);
float powf(float, float);
double pow(double, double);
long double powl(long double, long double);
float rintf(float);
double rint(double);
long double rintl(long double);
long lrintf(float);
long lrint(double);
long lrintl(long double);
long long llrintf(float);
long long llrint(double);
long long llrintl(long double);
float roundf(float);
double round(double);
long double roundl(long double);
long lroundf(float);
long lround(double);
long lroundl(long double);
long long llroundf(float);
long long llround(double);
long long llroundl(long double);
float roundevenf(float);
double roundeven(double);
long double roundevenl(long double);
float sinf(float);
double sin(double);
long double sinl(long double);
float sqrtf(float);
double sqrt(double);
long double sqrtl(long double);
float truncf(float);
double trunc(double);
long double truncl(long double);

// RV32-LABEL: define dso_local void @test(
// RV32-SAME: float noundef [[FARG:%.*]], double noundef [[DARG:%.*]], fp128 noundef [[LDARG:%.*]]) #[[ATTR0:[0-9]+]] {
// RV32-NEXT:  entry:
// RV32-NEXT:    [[FARG_ADDR:%.*]] = alloca float, align 4
// RV32-NEXT:    [[DARG_ADDR:%.*]] = alloca double, align 8
// RV32-NEXT:    [[LDARG_ADDR:%.*]] = alloca fp128, align 16
// RV32-NEXT:    store float [[FARG]], ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    store double [[DARG]], ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    store fp128 [[LDARG]], ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP0:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP1:%.*]] = call float @llvm.ceil.f32(float [[TMP0]])
// RV32-NEXT:    [[TMP2:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP3:%.*]] = call double @llvm.ceil.f64(double [[TMP2]])
// RV32-NEXT:    [[TMP4:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP5:%.*]] = call fp128 @llvm.ceil.f128(fp128 [[TMP4]])
// RV32-NEXT:    [[TMP6:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP7:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP8:%.*]] = call float @llvm.copysign.f32(float [[TMP6]], float [[TMP7]])
// RV32-NEXT:    [[TMP9:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP10:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP11:%.*]] = call double @llvm.copysign.f64(double [[TMP9]], double [[TMP10]])
// RV32-NEXT:    [[TMP12:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP13:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP14:%.*]] = call fp128 @llvm.copysign.f128(fp128 [[TMP12]], fp128 [[TMP13]])
// RV32-NEXT:    [[TMP15:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP16:%.*]] = call float @llvm.cos.f32(float [[TMP15]])
// RV32-NEXT:    [[TMP17:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP18:%.*]] = call double @llvm.cos.f64(double [[TMP17]])
// RV32-NEXT:    [[TMP19:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP20:%.*]] = call fp128 @llvm.cos.f128(fp128 [[TMP19]])
// RV32-NEXT:    [[TMP21:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP22:%.*]] = call float @llvm.exp.f32(float [[TMP21]])
// RV32-NEXT:    [[TMP23:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP24:%.*]] = call double @llvm.exp.f64(double [[TMP23]])
// RV32-NEXT:    [[TMP25:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP26:%.*]] = call fp128 @llvm.exp.f128(fp128 [[TMP25]])
// RV32-NEXT:    [[TMP27:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP28:%.*]] = call float @llvm.exp2.f32(float [[TMP27]])
// RV32-NEXT:    [[TMP29:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP30:%.*]] = call double @llvm.exp2.f64(double [[TMP29]])
// RV32-NEXT:    [[TMP31:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP32:%.*]] = call fp128 @llvm.exp2.f128(fp128 [[TMP31]])
// RV32-NEXT:    [[TMP33:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP34:%.*]] = call float @llvm.fabs.f32(float [[TMP33]])
// RV32-NEXT:    [[TMP35:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP36:%.*]] = call double @llvm.fabs.f64(double [[TMP35]])
// RV32-NEXT:    [[TMP37:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP38:%.*]] = call fp128 @llvm.fabs.f128(fp128 [[TMP37]])
// RV32-NEXT:    [[TMP39:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP40:%.*]] = call float @llvm.floor.f32(float [[TMP39]])
// RV32-NEXT:    [[TMP41:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP42:%.*]] = call double @llvm.floor.f64(double [[TMP41]])
// RV32-NEXT:    [[TMP43:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP44:%.*]] = call fp128 @llvm.floor.f128(fp128 [[TMP43]])
// RV32-NEXT:    [[TMP45:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP46:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP47:%.*]] = call float @llvm.maxnum.f32(float [[TMP45]], float [[TMP46]])
// RV32-NEXT:    [[TMP48:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP49:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP50:%.*]] = call double @llvm.maxnum.f64(double [[TMP48]], double [[TMP49]])
// RV32-NEXT:    [[TMP51:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP52:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP53:%.*]] = call fp128 @llvm.maxnum.f128(fp128 [[TMP51]], fp128 [[TMP52]])
// RV32-NEXT:    [[TMP54:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP55:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP56:%.*]] = call float @llvm.minnum.f32(float [[TMP54]], float [[TMP55]])
// RV32-NEXT:    [[TMP57:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP58:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP59:%.*]] = call double @llvm.minnum.f64(double [[TMP57]], double [[TMP58]])
// RV32-NEXT:    [[TMP60:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP61:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP62:%.*]] = call fp128 @llvm.minnum.f128(fp128 [[TMP60]], fp128 [[TMP61]])
// RV32-NEXT:    [[TMP63:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP64:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[FMOD:%.*]] = frem float [[TMP63]], [[TMP64]]
// RV32-NEXT:    [[TMP65:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP66:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[FMOD1:%.*]] = frem double [[TMP65]], [[TMP66]]
// RV32-NEXT:    [[TMP67:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP68:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[FMOD2:%.*]] = frem fp128 [[TMP67]], [[TMP68]]
// RV32-NEXT:    [[TMP69:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP70:%.*]] = call float @llvm.log.f32(float [[TMP69]])
// RV32-NEXT:    [[TMP71:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP72:%.*]] = call double @llvm.log.f64(double [[TMP71]])
// RV32-NEXT:    [[TMP73:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP74:%.*]] = call fp128 @llvm.log.f128(fp128 [[TMP73]])
// RV32-NEXT:    [[TMP75:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP76:%.*]] = call float @llvm.log10.f32(float [[TMP75]])
// RV32-NEXT:    [[TMP77:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP78:%.*]] = call double @llvm.log10.f64(double [[TMP77]])
// RV32-NEXT:    [[TMP79:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP80:%.*]] = call fp128 @llvm.log10.f128(fp128 [[TMP79]])
// RV32-NEXT:    [[TMP81:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP82:%.*]] = call float @llvm.log2.f32(float [[TMP81]])
// RV32-NEXT:    [[TMP83:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP84:%.*]] = call double @llvm.log2.f64(double [[TMP83]])
// RV32-NEXT:    [[TMP85:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP86:%.*]] = call fp128 @llvm.log2.f128(fp128 [[TMP85]])
// RV32-NEXT:    [[TMP87:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP88:%.*]] = call float @llvm.nearbyint.f32(float [[TMP87]])
// RV32-NEXT:    [[TMP89:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP90:%.*]] = call double @llvm.nearbyint.f64(double [[TMP89]])
// RV32-NEXT:    [[TMP91:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP92:%.*]] = call fp128 @llvm.nearbyint.f128(fp128 [[TMP91]])
// RV32-NEXT:    [[TMP93:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP94:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP95:%.*]] = call float @llvm.pow.f32(float [[TMP93]], float [[TMP94]])
// RV32-NEXT:    [[TMP96:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP97:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP98:%.*]] = call double @llvm.pow.f64(double [[TMP96]], double [[TMP97]])
// RV32-NEXT:    [[TMP99:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP100:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP101:%.*]] = call fp128 @llvm.pow.f128(fp128 [[TMP99]], fp128 [[TMP100]])
// RV32-NEXT:    [[TMP102:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP103:%.*]] = call float @llvm.rint.f32(float [[TMP102]])
// RV32-NEXT:    [[TMP104:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP105:%.*]] = call double @llvm.rint.f64(double [[TMP104]])
// RV32-NEXT:    [[TMP106:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP107:%.*]] = call fp128 @llvm.rint.f128(fp128 [[TMP106]])
// RV32-NEXT:    [[TMP108:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP109:%.*]] = call i32 @llvm.lrint.i32.f32(float [[TMP108]])
// RV32-NEXT:    [[TMP110:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP111:%.*]] = call i32 @llvm.lrint.i32.f64(double [[TMP110]])
// RV32-NEXT:    [[TMP112:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP113:%.*]] = call i32 @llvm.lrint.i32.f128(fp128 [[TMP112]])
// RV32-NEXT:    [[TMP114:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP115:%.*]] = call i32 @llvm.lrint.i32.f32(float [[TMP114]])
// RV32-NEXT:    [[TMP116:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP117:%.*]] = call i64 @llvm.llrint.i64.f64(double [[TMP116]])
// RV32-NEXT:    [[TMP118:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP119:%.*]] = call i64 @llvm.llrint.i64.f128(fp128 [[TMP118]])
// RV32-NEXT:    [[TMP120:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP121:%.*]] = call float @llvm.round.f32(float [[TMP120]])
// RV32-NEXT:    [[TMP122:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP123:%.*]] = call double @llvm.round.f64(double [[TMP122]])
// RV32-NEXT:    [[TMP124:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP125:%.*]] = call fp128 @llvm.round.f128(fp128 [[TMP124]])
// RV32-NEXT:    [[TMP126:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP127:%.*]] = call i32 @llvm.lround.i32.f32(float [[TMP126]])
// RV32-NEXT:    [[TMP128:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP129:%.*]] = call i32 @llvm.lround.i32.f64(double [[TMP128]])
// RV32-NEXT:    [[TMP130:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP131:%.*]] = call i32 @llvm.lround.i32.f128(fp128 [[TMP130]])
// RV32-NEXT:    [[TMP132:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP133:%.*]] = call i64 @llvm.llround.i64.f32(float [[TMP132]])
// RV32-NEXT:    [[TMP134:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP135:%.*]] = call i64 @llvm.llround.i64.f64(double [[TMP134]])
// RV32-NEXT:    [[TMP136:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP137:%.*]] = call i64 @llvm.llround.i64.f128(fp128 [[TMP136]])
// RV32-NEXT:    [[TMP138:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP139:%.*]] = call float @llvm.roundeven.f32(float [[TMP138]])
// RV32-NEXT:    [[TMP140:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP141:%.*]] = call double @llvm.roundeven.f64(double [[TMP140]])
// RV32-NEXT:    [[TMP142:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP143:%.*]] = call fp128 @llvm.roundeven.f128(fp128 [[TMP142]])
// RV32-NEXT:    [[TMP144:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP145:%.*]] = call float @llvm.sin.f32(float [[TMP144]])
// RV32-NEXT:    [[TMP146:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP147:%.*]] = call double @llvm.sin.f64(double [[TMP146]])
// RV32-NEXT:    [[TMP148:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP149:%.*]] = call fp128 @llvm.sin.f128(fp128 [[TMP148]])
// RV32-NEXT:    [[TMP150:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP151:%.*]] = call float @llvm.sqrt.f32(float [[TMP150]])
// RV32-NEXT:    [[TMP152:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP153:%.*]] = call double @llvm.sqrt.f64(double [[TMP152]])
// RV32-NEXT:    [[TMP154:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP155:%.*]] = call fp128 @llvm.sqrt.f128(fp128 [[TMP154]])
// RV32-NEXT:    [[TMP156:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV32-NEXT:    [[TMP157:%.*]] = call float @llvm.trunc.f32(float [[TMP156]])
// RV32-NEXT:    [[TMP158:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV32-NEXT:    [[TMP159:%.*]] = call double @llvm.trunc.f64(double [[TMP158]])
// RV32-NEXT:    [[TMP160:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV32-NEXT:    [[TMP161:%.*]] = call fp128 @llvm.trunc.f128(fp128 [[TMP160]])
// RV32-NEXT:    ret void
//
// RV64-LABEL: define dso_local void @test(
// RV64-SAME: float noundef [[FARG:%.*]], double noundef [[DARG:%.*]], fp128 noundef [[LDARG:%.*]]) #[[ATTR0:[0-9]+]] {
// RV64-NEXT:  entry:
// RV64-NEXT:    [[FARG_ADDR:%.*]] = alloca float, align 4
// RV64-NEXT:    [[DARG_ADDR:%.*]] = alloca double, align 8
// RV64-NEXT:    [[LDARG_ADDR:%.*]] = alloca fp128, align 16
// RV64-NEXT:    store float [[FARG]], ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    store double [[DARG]], ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    store fp128 [[LDARG]], ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP0:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP1:%.*]] = call float @llvm.ceil.f32(float [[TMP0]])
// RV64-NEXT:    [[TMP2:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP3:%.*]] = call double @llvm.ceil.f64(double [[TMP2]])
// RV64-NEXT:    [[TMP4:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP5:%.*]] = call fp128 @llvm.ceil.f128(fp128 [[TMP4]])
// RV64-NEXT:    [[TMP6:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP7:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP8:%.*]] = call float @llvm.copysign.f32(float [[TMP6]], float [[TMP7]])
// RV64-NEXT:    [[TMP9:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP10:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP11:%.*]] = call double @llvm.copysign.f64(double [[TMP9]], double [[TMP10]])
// RV64-NEXT:    [[TMP12:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP13:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP14:%.*]] = call fp128 @llvm.copysign.f128(fp128 [[TMP12]], fp128 [[TMP13]])
// RV64-NEXT:    [[TMP15:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP16:%.*]] = call float @llvm.cos.f32(float [[TMP15]])
// RV64-NEXT:    [[TMP17:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP18:%.*]] = call double @llvm.cos.f64(double [[TMP17]])
// RV64-NEXT:    [[TMP19:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP20:%.*]] = call fp128 @llvm.cos.f128(fp128 [[TMP19]])
// RV64-NEXT:    [[TMP21:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP22:%.*]] = call float @llvm.exp.f32(float [[TMP21]])
// RV64-NEXT:    [[TMP23:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP24:%.*]] = call double @llvm.exp.f64(double [[TMP23]])
// RV64-NEXT:    [[TMP25:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP26:%.*]] = call fp128 @llvm.exp.f128(fp128 [[TMP25]])
// RV64-NEXT:    [[TMP27:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP28:%.*]] = call float @llvm.exp2.f32(float [[TMP27]])
// RV64-NEXT:    [[TMP29:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP30:%.*]] = call double @llvm.exp2.f64(double [[TMP29]])
// RV64-NEXT:    [[TMP31:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP32:%.*]] = call fp128 @llvm.exp2.f128(fp128 [[TMP31]])
// RV64-NEXT:    [[TMP33:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP34:%.*]] = call float @llvm.fabs.f32(float [[TMP33]])
// RV64-NEXT:    [[TMP35:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP36:%.*]] = call double @llvm.fabs.f64(double [[TMP35]])
// RV64-NEXT:    [[TMP37:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP38:%.*]] = call fp128 @llvm.fabs.f128(fp128 [[TMP37]])
// RV64-NEXT:    [[TMP39:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP40:%.*]] = call float @llvm.floor.f32(float [[TMP39]])
// RV64-NEXT:    [[TMP41:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP42:%.*]] = call double @llvm.floor.f64(double [[TMP41]])
// RV64-NEXT:    [[TMP43:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP44:%.*]] = call fp128 @llvm.floor.f128(fp128 [[TMP43]])
// RV64-NEXT:    [[TMP45:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP46:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP47:%.*]] = call float @llvm.maxnum.f32(float [[TMP45]], float [[TMP46]])
// RV64-NEXT:    [[TMP48:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP49:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP50:%.*]] = call double @llvm.maxnum.f64(double [[TMP48]], double [[TMP49]])
// RV64-NEXT:    [[TMP51:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP52:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP53:%.*]] = call fp128 @llvm.maxnum.f128(fp128 [[TMP51]], fp128 [[TMP52]])
// RV64-NEXT:    [[TMP54:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP55:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP56:%.*]] = call float @llvm.minnum.f32(float [[TMP54]], float [[TMP55]])
// RV64-NEXT:    [[TMP57:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP58:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP59:%.*]] = call double @llvm.minnum.f64(double [[TMP57]], double [[TMP58]])
// RV64-NEXT:    [[TMP60:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP61:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP62:%.*]] = call fp128 @llvm.minnum.f128(fp128 [[TMP60]], fp128 [[TMP61]])
// RV64-NEXT:    [[TMP63:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP64:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[FMOD:%.*]] = frem float [[TMP63]], [[TMP64]]
// RV64-NEXT:    [[TMP65:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP66:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[FMOD1:%.*]] = frem double [[TMP65]], [[TMP66]]
// RV64-NEXT:    [[TMP67:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP68:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[FMOD2:%.*]] = frem fp128 [[TMP67]], [[TMP68]]
// RV64-NEXT:    [[TMP69:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP70:%.*]] = call float @llvm.log.f32(float [[TMP69]])
// RV64-NEXT:    [[TMP71:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP72:%.*]] = call double @llvm.log.f64(double [[TMP71]])
// RV64-NEXT:    [[TMP73:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP74:%.*]] = call fp128 @llvm.log.f128(fp128 [[TMP73]])
// RV64-NEXT:    [[TMP75:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP76:%.*]] = call float @llvm.log10.f32(float [[TMP75]])
// RV64-NEXT:    [[TMP77:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP78:%.*]] = call double @llvm.log10.f64(double [[TMP77]])
// RV64-NEXT:    [[TMP79:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP80:%.*]] = call fp128 @llvm.log10.f128(fp128 [[TMP79]])
// RV64-NEXT:    [[TMP81:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP82:%.*]] = call float @llvm.log2.f32(float [[TMP81]])
// RV64-NEXT:    [[TMP83:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP84:%.*]] = call double @llvm.log2.f64(double [[TMP83]])
// RV64-NEXT:    [[TMP85:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP86:%.*]] = call fp128 @llvm.log2.f128(fp128 [[TMP85]])
// RV64-NEXT:    [[TMP87:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP88:%.*]] = call float @llvm.nearbyint.f32(float [[TMP87]])
// RV64-NEXT:    [[TMP89:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP90:%.*]] = call double @llvm.nearbyint.f64(double [[TMP89]])
// RV64-NEXT:    [[TMP91:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP92:%.*]] = call fp128 @llvm.nearbyint.f128(fp128 [[TMP91]])
// RV64-NEXT:    [[TMP93:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP94:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP95:%.*]] = call float @llvm.pow.f32(float [[TMP93]], float [[TMP94]])
// RV64-NEXT:    [[TMP96:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP97:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP98:%.*]] = call double @llvm.pow.f64(double [[TMP96]], double [[TMP97]])
// RV64-NEXT:    [[TMP99:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP100:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP101:%.*]] = call fp128 @llvm.pow.f128(fp128 [[TMP99]], fp128 [[TMP100]])
// RV64-NEXT:    [[TMP102:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP103:%.*]] = call float @llvm.rint.f32(float [[TMP102]])
// RV64-NEXT:    [[TMP104:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP105:%.*]] = call double @llvm.rint.f64(double [[TMP104]])
// RV64-NEXT:    [[TMP106:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP107:%.*]] = call fp128 @llvm.rint.f128(fp128 [[TMP106]])
// RV64-NEXT:    [[TMP108:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP109:%.*]] = call i64 @llvm.lrint.i64.f32(float [[TMP108]])
// RV64-NEXT:    [[TMP110:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP111:%.*]] = call i64 @llvm.lrint.i64.f64(double [[TMP110]])
// RV64-NEXT:    [[TMP112:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP113:%.*]] = call i64 @llvm.lrint.i64.f128(fp128 [[TMP112]])
// RV64-NEXT:    [[TMP114:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP115:%.*]] = call i64 @llvm.lrint.i64.f32(float [[TMP114]])
// RV64-NEXT:    [[TMP116:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP117:%.*]] = call i64 @llvm.llrint.i64.f64(double [[TMP116]])
// RV64-NEXT:    [[TMP118:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP119:%.*]] = call i64 @llvm.llrint.i64.f128(fp128 [[TMP118]])
// RV64-NEXT:    [[TMP120:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP121:%.*]] = call float @llvm.round.f32(float [[TMP120]])
// RV64-NEXT:    [[TMP122:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP123:%.*]] = call double @llvm.round.f64(double [[TMP122]])
// RV64-NEXT:    [[TMP124:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP125:%.*]] = call fp128 @llvm.round.f128(fp128 [[TMP124]])
// RV64-NEXT:    [[TMP126:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP127:%.*]] = call i64 @llvm.lround.i64.f32(float [[TMP126]])
// RV64-NEXT:    [[TMP128:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP129:%.*]] = call i64 @llvm.lround.i64.f64(double [[TMP128]])
// RV64-NEXT:    [[TMP130:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP131:%.*]] = call i64 @llvm.lround.i64.f128(fp128 [[TMP130]])
// RV64-NEXT:    [[TMP132:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP133:%.*]] = call i64 @llvm.llround.i64.f32(float [[TMP132]])
// RV64-NEXT:    [[TMP134:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP135:%.*]] = call i64 @llvm.llround.i64.f64(double [[TMP134]])
// RV64-NEXT:    [[TMP136:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP137:%.*]] = call i64 @llvm.llround.i64.f128(fp128 [[TMP136]])
// RV64-NEXT:    [[TMP138:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP139:%.*]] = call float @llvm.roundeven.f32(float [[TMP138]])
// RV64-NEXT:    [[TMP140:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP141:%.*]] = call double @llvm.roundeven.f64(double [[TMP140]])
// RV64-NEXT:    [[TMP142:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP143:%.*]] = call fp128 @llvm.roundeven.f128(fp128 [[TMP142]])
// RV64-NEXT:    [[TMP144:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP145:%.*]] = call float @llvm.sin.f32(float [[TMP144]])
// RV64-NEXT:    [[TMP146:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP147:%.*]] = call double @llvm.sin.f64(double [[TMP146]])
// RV64-NEXT:    [[TMP148:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP149:%.*]] = call fp128 @llvm.sin.f128(fp128 [[TMP148]])
// RV64-NEXT:    [[TMP150:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP151:%.*]] = call float @llvm.sqrt.f32(float [[TMP150]])
// RV64-NEXT:    [[TMP152:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP153:%.*]] = call double @llvm.sqrt.f64(double [[TMP152]])
// RV64-NEXT:    [[TMP154:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP155:%.*]] = call fp128 @llvm.sqrt.f128(fp128 [[TMP154]])
// RV64-NEXT:    [[TMP156:%.*]] = load float, ptr [[FARG_ADDR]], align 4
// RV64-NEXT:    [[TMP157:%.*]] = call float @llvm.trunc.f32(float [[TMP156]])
// RV64-NEXT:    [[TMP158:%.*]] = load double, ptr [[DARG_ADDR]], align 8
// RV64-NEXT:    [[TMP159:%.*]] = call double @llvm.trunc.f64(double [[TMP158]])
// RV64-NEXT:    [[TMP160:%.*]] = load fp128, ptr [[LDARG_ADDR]], align 16
// RV64-NEXT:    [[TMP161:%.*]] = call fp128 @llvm.trunc.f128(fp128 [[TMP160]])
// RV64-NEXT:    ret void
//
void test(float farg, double darg, long double ldarg) {
	ceilf(farg); ceil(darg); ceill(ldarg);
	copysignf(farg, farg); copysign(darg, darg); copysignl(ldarg, ldarg);
	cosf(farg); cos(darg); cosl(ldarg);
	expf(farg); exp(darg); expl(ldarg);
	exp2f(farg); exp2(darg); exp2l(ldarg);
	fabsf(farg); fabs(darg); fabsl(ldarg);
	floorf(farg); floor(darg); floorl(ldarg);
	fmaxf(farg, farg); fmax(darg, darg); fmaxl(ldarg, ldarg);
	fminf(farg, farg); fmin(darg, darg); fminl(ldarg, ldarg);
	fmodf(farg, farg); fmod(darg, darg); fmodl(ldarg, ldarg);
	logf(farg); log(darg); logl(ldarg);
	log10f(farg); log10(darg); log10l(ldarg);
	log2f(farg); log2(darg); log2l(ldarg);
	nearbyintf(farg); nearbyint(darg); nearbyintl(ldarg);
	powf(farg, farg); pow(darg, darg); powl(ldarg, ldarg);
	rintf(farg); rint(darg); rintl(ldarg);
	lrintf(farg); lrint(darg); lrintl(ldarg);
	lrintf(farg); llrint(darg); llrintl(ldarg);
	roundf(farg); round(darg); roundl(ldarg);
	lroundf(farg); lround(darg); lroundl(ldarg);
	llroundf(farg); llround(darg); llroundl(ldarg);
	roundevenf(farg); roundeven(darg); roundevenl(ldarg);
	sinf(farg); sin(darg); sinl(ldarg);
	sqrtf(farg); sqrt(darg); sqrtl(ldarg);
	truncf(farg); trunc(darg); truncl(ldarg);
}
