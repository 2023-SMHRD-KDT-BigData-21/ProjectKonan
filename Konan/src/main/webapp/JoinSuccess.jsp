<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>국민탐정 - 로딩중</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="assets/css/main.css" />

</head>

<style>
html, body {
    margin: 0;
    padding: 0;
}

* {
    /*outline: 1px dotted yellow;*/
    box-sizing: border-box;
}

.stage {
    --c-bg: hsl(262,39%,20%);

    align-items: center;
    background-color: var(--c-bg);
    display: flex;
    height: 100vh;
    justify-content: center;
    overflow-y: hidden;
    width: 100vw;
}

.scene {
    height: 500px;
    position: relative;
    width: 400px;
}
.scene::before {
    --c-bg: hsl(262,39%,22%);
    --c-glow: hsl(262,39%,20%);
    --size: 600px;

    animation: scene-anim .6s infinite steps(6);
    background: var(--c-bg);
    border-radius: var(--size);
    box-shadow: inset 0 0 0 3px var(--c-glow);
    content: '';
    height: var(--size);
    left: calc(50% - (var(--size) /2));
    position: absolute;
    top: -50px;
    width: var(--size);
}

@keyframes scene-anim {
    0% {
        box-shadow: inset 0 0 0 3px var(--c-glow);
    }
    20% {
        box-shadow: inset 0 0 0 8px var(--c-glow);
    }
    40% {
        box-shadow: inset 0 0 0 2px var(--c-glow);
    }
    60% {
        box-shadow: inset 0 0 0 6px var(--c-glow);
    }
    80% {
        box-shadow: inset 0 0 0 3px var(--c-glow);
    }
    100% {
        box-shadow: inset 0 0 0 5px var(--c-glow);
    }
}


.halo {
    --c-1: hsl(257,39%,27%);
    --c-2: hsl(259,38%,33%);
    --c-3: hsl(322,41%,43%);
    --c-4: hsl(346,86%,65%);
    --s-core: 100px;
    --s-1: 120px;
    --s-2: 90px;
    --s-3: 60px;
    --s-4: 30px;
}
.halo i {
    --c: var(--c-1);
    --s: var(--s-1);

    animation: 4s halo-anim .4s ease-in-out infinite;
    background-color: var(--c);
    box-shadow: 0 0 0 var(--s) var(--c);
    border-radius: 50%;
    display: block;
    left: calc(50% - (var(--s-core) / 2));
    height: var(--s-core);
    position: absolute;
    top: 50%;
    transform-origin: center center;
    width: var(--s-core);
}
.halo i:nth-of-type(2) {
    animation-delay: .3s;
    --c: var(--c-2);
    --s: var(--s-2);
}
.halo i:nth-of-type(3) {
    animation-delay: .2s;
    --c: var(--c-3);
    --s: var(--s-3);
}
.halo i:nth-of-type(4) {
    animation-delay: .1s;
    --c: var(--c-4);
    --s: var(--s-4);
}

.halo-star {
    --size: calc(var(--s-core) + (var(--s-1) * 2) - 15px);

    animation: halo-star-anim linear 5s forwards infinite;
    background:
            radial-gradient(circle at center, var(--c-1) 69.5%, transparent 69.5%),
            linear-gradient(to right, transparent 50%, var(--c-3) 50%, var(--c-3) 52%, rgba(255, 255, 255, .1) 52%, transparent 70%);
    border-radius: 50%;
    clip: rect(0px var(--size) calc(var(--size) / 2) 0px);
    display: block;
    height: var(--size);
    left: calc(50% - (var(--size) / 2));
    position: absolute;
    transform-origin: center center;
    top: calc(50% - var(--s-1) + 8px);
    width: var(--size);
}
.halo-star:nth-child(2) {
    animation-delay: calc(5s / 3);
}
.halo-star:nth-child(3) {
    animation-delay: calc((5s / 3) * 2);
}

@keyframes halo-anim {
    50% {
        transform: scale(1.05);
    }
}
@keyframes halo-star-anim {
    100% {
        transform: rotateZ(-360deg);
    }
}

.lantern {
    --c-lantern-body: hsl(262,38%,20%);
    --c-lantern-light: hsl(23,98%,75%);
    --c-lantern-glow: hsl(343,83%,63%);

    display: flex;
    flex-direction: column;
    left: calc(50%);
    position: absolute;
    transform: translateX(-50%);
    z-index: 1;
}
.lantern-handle {
    border: 6px solid hsl(257,41%,27%);
    border-radius: 50px;
    height: 105px;
    width: 200px;
}
.lantern-inner {
    animation: lantern-anim 1.2s ease-in-out alternate infinite;
    margin-top: -5px;
    transform-origin: top center;
}
.lantern-chain {
    height: 60px;
}
.lantern-chain::before {
    --c: hsl(260,38%,34%);

    background-color: var(--c);
    box-shadow:
            0 0 0 5px var(--c),
            0 20px 0 var(--c),
            0 35px 0 var(--c),
            0 50px 0 var(--c);
    border-radius: 50%;
    content: '';
    display: block;
    height: 10px;
    margin: 0 auto;
    width: 10px;
}

.lantern-head::before,
.lantern-head::after {
    background: var(--c-lantern-body);
    border-radius: 5px;
    content: '';
    display: block;
    height: 15px;
}
.lantern-head::before {
    margin: 0 auto;
    width: 100px;
}
.lantern-head::after {
    border-radius: 3px;
    height: 30px;
    margin: 3px auto;
    width: 60px;
}

.lantern-body {
    perspective: 350px;
    position: relative;
}
.lantern-body::before {
    background-color: var(--c-lantern-light);
    border: 8px solid var(--c-lantern-body);
    border-radius: 50px;
    box-shadow:
            inset 0 0 0 5px var(--c-lantern-light),
            inset 0 0 0 20px var(--c-lantern-glow);
    content: '';
    display: block;
    height: 195px;
    margin: 0 auto;
    perspective: 100px;
    transform: rotateX(20deg) translateY(-20px);
    transform-origin: center center;
    width: 120px;
}
.lantern-body::after {
    --c: hsl(321,41%,42%);
    background-color: var(--c);
    border-radius: 4px;
    box-shadow: -5px 161px 0 1px var(--c), 5px 161px 0 1px var(--c);
    content: '';
    display: block;
    height: 7px;
    margin: -7px auto 0;
    transform: translateY(-195px);
    width: 40px;
}

.lantern-spark {
    animation: lantern-spark-anim linear 2s forwards infinite;
    background:
            radial-gradient(circle at center, var(--c-lantern-light) 60%, transparent 60%),
            linear-gradient(to right, transparent 10%, #fff 50%, transparent 50%);
    border-radius: 50%;
    clip: rect(0px 30px 30px 0px);
    height: 60px;
    left: calc(50% - 30px);
    position: absolute;
    top: calc(45% - 30px);
    transform-origin: center center;
    width: 60px;
}
.lantern-spark:nth-child(2) {
    animation-delay: calc(2s / 3);
}
.lantern-spark:nth-child(3) {
    animation-delay: calc((2s / 3) * 2);
}

.lantern-flame {
    background-color: #fff;
    border-radius: 50%;
    height: 30px;
    left: calc(50% - 15px);
    position: absolute;
    top: calc(45% - 15px);
    width: 30px;
}

.lantern-base {
    background: var(--c-lantern-body);
    border-radius: 5px;
    display: block;
    height: 15px;
    margin: -15px auto 0;
    width: 70px;
}

@keyframes lantern-anim {
    0% {
        transform: rotateZ(1deg);
    }
    100% {
        transform: rotateZ(-1deg);
    }
}
@keyframes lantern-spark-anim {
    100% {
        transform: rotateZ(360deg);
    }
}

.planet {
    --bg: hsl(257,39%,27%);
    --light: hsl(348,88%,65%);
    --orbit: 150px;

    animation: planet-anim 5s forwards infinite;
    background: var(--bg);
    border: 2px solid var(--bg);
    border-radius: 50%;
    box-shadow: 0 0 5px rgba(0, 0, 0, .25);
    height: 30px;
    left: calc(50% - 15px);
    overflow: hidden;
    position: absolute;
    top: 50%;
    transform-origin: center center;
    width: 30px;
}
.planet::before {
    animation: planet-light-anim 2.5s forwards linear infinite;
    background-color: var(--light);
    border-radius: 50%;
    content: '';
    position: absolute;

    top: -20px;
    right: -20px;
    bottom: -20px;
    left: -20px;
}

.planet:nth-child(1) {
    --orbit: 70px;
    animation-delay: -.3s;
    transform: scale(.9) translateY(-80px);
}
.planet:nth-child(2) {
    --bg: hsl(344,83%,63%);
    --light: hsl(19,98%,75%);
    --orbit: 100px;
    animation-delay: -2s;
    animation-duration: 5.5s;
    transform: scale(.8) translateY(-20px);
}
.planet:nth-child(3) {
    --bg: hsl(344,83%,63%);
    --light: hsl(19,98%,75%);
    --orbit: 100px;
    animation-delay: -4s;
    animation-duration: 4.5s;
    transform: scale(.4) translateY(100px);
}
.planet:nth-child(4) {
    --bg: hsl(322,41%,43%);
    --light: hsl(348,88%,65%);
    --orbit: 120px;
    animation-delay: -3.7s;
    animation-duration: 4.2s;
    transform: scale(.8) translateY(75px);
}
.planet:nth-child(5) {
    --bg: hsl(322,41%,43%);
    --light: hsl(348,88%,65%);
    --orbit: 100px;
    animation-delay: -1.3s;
    animation-duration: 5.8s;
    transform: scale(.4) translateY(40px);
}
.planet:nth-child(6) {
    --orbit: 90px;
    animation-delay: .5s;
    animation-duration: 4.2s;
    transform: scale(.9) translateY(150px);
}

@keyframes planet-anim {
    0% {
        margin-left: calc(var(--orbit) * -1);
        z-index: 1;
    }
    50% {
        margin-left: var(--orbit);
        z-index: 1;
    }
    50.1% {
        margin-left: var(--orbit);
        z-index: 0;
    }
    100% {
        margin-left: calc(var(--orbit) * -1);
        z-index: 0;
    }
}
@keyframes planet-light-anim {
    0% {
        transform: translateX(-100%);
    }
    50% {
        transform: translateX(0);
    }
    100% {
        transform: translateX(100%);
    }
}
</style>

<body>
    <div class="stage">
    <div class="scene">
        <div class="halo">
            <i></i>
            <span class="halo-star"></span>
            <span class="halo-star"></span>
            <span class="halo-star"></span>
            <i></i>
            <i></i>
            <i></i>
        </div>
        <div class="lantern">
            <div class="lantern-handle"></div>
            <div class="lantern-inner">
                <div class="lantern-chain"></div>
                <div class="lantern-head"></div>
                <div class="lantern-body">
                    <div class="lantern-spark"></div>
                    <div class="lantern-spark"></div>
                    <div class="lantern-spark"></div>
                    <div class="lantern-flame"></div>
                </div>
                <div class="lantern-base"></div>
            </div>
        </div>
        <div class="planets">
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
        </div>
    </div>
</div>
<script>
    // 5초 후에 다음 페이지로 이동하는 함수
    setTimeout(function() {
        window.location.href = 'Main.jsp'; // 다음 페이지의 URL을 여기에 입력하세요
    }, 2000); // 시간은 밀리초 단위로 지정됩니다 (2000은 2초를 의미합니다)
</script>
</body>
</html>

