# 适用于 Windows 的 Linux 工具

这个仓库提供了一种在 Windows 操作系统上使用 Linux 工具的最佳实践。

# 使用方法

要在 Windows 上使用 Linux 工具，请按照以下步骤进行操作：

- 打开命令行执行
    
    ```batch
    @rem Gnu Make is better than busybox's make
    winget install GnuWin32.Make
    mklink "%USERPROFILE%\AppData\Local\Microsoft\WinGet\Links\make.exe" "C:\Program Files (x86)\GnuWin32\bin\make.exe"
    winget install Git.MinGit
    winget install frippery.busybox-w32
    busybox --install
    ```
    
- 重启终端等工具使新环境变量生效
    
按照这些步骤，您将能够直接在 Windows 系统上访问和使用各种 Linux 工具。

# 解释说明

请注意，此解决方案专为需要 Linux 工具但更喜欢在 Windows 环境中工作的强迫症患者用户而设计，包括常用 Linux 工具和 Git。

我也尝试过使用诸如 `WSL1`、`WSL2`、`Git for Windows（MSYS2）` 等工具，

实践中 `WSL2` 会遇到一些奇怪的 Bug 且性能不佳。

主要是因为 hyperV 并不好用，`WSL2` 的网络配置有 Bug，此外开启 hyperV 还会导致宿主机性能下降(CPU: 8Gen I7)且不能正常使用模拟器。

我的评价是虚拟机用 Linux 想要体验好还是 ssh 到实机或者用 VMware 开虚拟机了。


转为使用原生的可执行文件实现

使用 `WSL1` 尚可，但是提升体验需要如 `wslgit` 这样的工具转换目录和传递参数等。

最佳的方案是使用完整 `Git for Windows` 或 `MSYS2` 并将其内置的 Linux 工具添加到环境变量中。

可以用但是带的东西太多，不需要，并且也会有目录转换问题

所以强迫症患者对其进行优化：

Linux 工具使用 [busybox-w32](https://frippery.org/busybox/) 的 64位 Unicode 版本代替

Git 使用官方的 `mingit` 代替

> 为什么不使用 `mingit-busybox` 然后用它内置的 `busybox`?
> 
> 首先，没有使用 `mingit-busybox` 是因为 `winget` 目前还未收录  `mingit-busybox` 这个版本的 git
> 
> 使用 `winget` 安装软件简单方便，会自动配置环境变量，新系统可非常方便的重现。
>
> 其次 `mingit-busybox` 和  `mingit` 两个版本安装后的占用区别并不大
> 
> 最后经过测试，`mingit-busybox` 自带的 busybox 不是最新版的 64 位 Unicode 版本。会在一些命令上遇到中文乱码的问题。
>
> 当然不喜欢简单方便的命令，喜欢自己动手的可以手动下载 `mingit-busybox` 并自己配置也不失为一个好的方法。

完成！


# Linux Tools for Windows

This repository provides a best practice for using Linux tools on the Windows operating system.

# Usage

To use Linux tools on Windows, follow these steps:

- Open the command prompt and execute the following commands:

    see above

- Restart the terminal or any other tools to activate the new environment variables.

By following these steps, you will be able to access and use various Linux tools directly on the Windows system.

# Explanation

Please note that this solution is specifically designed for perfectionist users who require Linux tools but prefer to work within the Windows environment. It includes commonly used Linux tools and Git.

I have also tried tools like `WSL1`, `WSL2`, and `Git for Windows (MSYS2)`. In practice, `WSL2` encounters strange bugs and has poor performance. This is mainly due to the issues with hyperV and the network configuration bug in `WSL2`. Additionally, enabling hyperV reduces the host machine's performance (CPU: 8th Gen I7) and prevents the use of emulators.

In my opinion, if you want a good Linux experience, it's better to use a virtual machine or SSH into a physical machine or use VMware to create a virtual machine.

The alternative solution is to use native executable files. `WSL1` is still acceptable, but for an improved experience, tools like `wslgit` are needed for directory conversion and passing parameters.

The best approach is to use the full version of `Git for Windows` or `MSYS2` and add their built-in Linux tools to the environment variables.

While they can be used, they come with unnecessary components and can have directory conversion issues. So, for perfectionist users, optimization is necessary:

- Use the 64-bit Unicode version of [busybox-w32](https://frippery.org/busybox/) as a replacement for Linux tools.
- Use the official `mingit` as a replacement for Git.

> Why not use `mingit-busybox` with its built-in `busybox`?
> 
> First, `mingit-busybox` is not yet included in `winget`, so it's not available for installation through that method.
> 
> Using `winget` for software installation is simple and convenient, and it automatically configures the environment variables, making it easy to reproduce on new systems.
> 
> Second, the difference in disk space usage between `mingit-busybox` and `mingit` is not significant.
> 
> Lastly, after testing, it was found that the built-in busybox in `mingit-busybox` is not the latest version of the 64-bit Unicode version. This can cause issues with Chinese characters in some commands.
> 
> Of course, if you prefer more hands-on approaches and don't mind the convenience of commands, you can manually download `mingit-busybox` and configure it yourself, which is also a good option.

Done!

